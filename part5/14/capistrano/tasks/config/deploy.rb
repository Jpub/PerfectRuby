# -*- encoding: utf-8 -*-

set :application, "pruby_project"
set :repository,  "https://github.com/ryopeko/todo.git"

set(:db_password) { Capistrano::CLI.password_prompt("DB password: ") }

#SSH 사용자를 명시하는 경우에 사용
#set :user, "ryopeko"

# 필요하면 배포 전략을 아래와 같이 지정
#set :deploy_via, :checkout
#set :deploy_via, :remote
#set :deploy_via, :copy
#set :deploy_via, :remote_cache
#set :deploy_via, :unshared_remote_cache
#set :repository_cache, "/var/www/pruby_project/shared/cached-copy"

set :use_sudo, false

set :scm, :git

#git가 아닌 Subversion을 사용하고 있으면 아래와 같이 설정
#set :scm, :subversion

role :web, "pruby-web-server"
role :app, "pruby-web-server"
role :db,  "pruby-web-server", :primary => true
role :db,  "pruby-db-slave-server"

set :deploy_to, "/var/www/#{application}"

desc 'echo at remote server'
task :hello_capistrano do
  run 'echo "Hello, Capistrano!"'
end

desc 'echo at web & app server'
task :hello_web_and_app_server, :roles => [ :web, :app ] do
  run 'echo "Hello, Web&App Server!"'
end

namespace :list do
  desc 'execute ls'
  task :ls do
    run 'ls'
  end

  desc 'execute ls -l'
  task :ls_detail do
    run 'ls -l'
  end
end

desc 'transaction rollback test'
task :has_error, :roles => :app do
  transaction do
    on_rollback { run 'echo "has error"' }
    run 'command_does_not_exists "error?"'
  end
end

desc 'before task'
task :before_task, :roles => :app do
  run 'echo "this is before task"'
end

desc 'after task'
task :after_task, :roles => :app do
  run 'echo "this is after task"'
end

desc 'main task'
task :main_task, :roles => :app do
  run 'echo "this is main task"'
end

before 'main_task', 'before_task'
after 'main_task', 'after_task'

after 'hello_capistrano' do
  run ('echo "Bye Capistrano!!"')
end

desc 'connect to db client'
task :db_connect, :roles => :db do
  run "db_connect --user='pruby' --password=#{db_password}"
end

desc 'need sudo'
task :use_sudo_command, :roles => :app do
  run "touch /tmp/cap_tmp"
  sudo 'rm /tmp/cap_tmp', :as => 'sekiguchi.ryoichi'
end

desc 'log size watch'
task :log_size_watcher do
  log_file = "#{deploy_to}/shared/log/development.log"
  ls_result = capture("ls -l #{log_file}")
  file_size = ls_result.squeeze.split(/ /)[4].to_i

  p "file size alert" if file_size > 100
end

desc 'log stream'
task :tail_log do
  stream("tail -f #{deploy_to}/shared/log/development.log")
end

