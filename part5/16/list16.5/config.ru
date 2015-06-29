require 'rack'

class URLFilter
  def initialize(app)
    @app = app
    puts @app.class
  end

  def call(env)
    puts @app.class
    if env['PATH_INFO'] == '/admin'
      [404, {'Content-Type' => 'text/plain'}, ["Not Found.(PATH=#{env['PATH_INFO']})"]]
    else
      @app.call(env)
    end
  end
end

class RackApplication
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ['hello!']]
  end
end

use URLFilter
use Rack::Auth::Basic do |username, password|
  username == password
end

run RackApplication.new
