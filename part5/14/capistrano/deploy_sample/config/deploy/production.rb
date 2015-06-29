
role :web, "pruby-web-server"
role :app, "pruby-web-server"
role :db,  "pruby-web-server", :primary => true

set :deploy_to, "/var/www/#{application}"

