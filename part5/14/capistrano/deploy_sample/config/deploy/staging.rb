role :web, "pruby-staging-server"
role :app, "pruby-staging-server"
role :db,  "pruby-staging-server", :primary => true

set :deploy_to, "/var/www_staging/#{application}"

