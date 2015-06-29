# -*- encoding: utf-8 -*-

set :stages, %w(production staging)
set :default_stage, :production

require 'capistrano/ext/multistage'

set :application, "pruby_project"
set :repository,  "https://github.com/ryopeko/todo.git"

set :deploy_via, :remote_cache

set :use_sudo, false

set :scm, :git

role :web, "pruby-web-server"
role :app, "pruby-web-server"
role :db,  "pruby-web-server", :primary => true

