require 'sinatra/base'

class URLFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/admin'
      [404, {'Content-Type' => 'text/plain'}, ["Not Found.(PATH=#{env['PATH_INFO']})"]]
    else
      @app.call(env)
    end
  end
end

class Application < Sinatra::Base
  use URLFilter
  use Rack::Auth::Basic do |username, password|
    username == password
  end

  get '/' do
    'Hello! Sinatra!'
  end
end

Application.run!
