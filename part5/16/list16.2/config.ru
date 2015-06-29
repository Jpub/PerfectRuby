require 'pp'
require 'rack'

class RackApplication
  def call(env)
    pp env
    [200, {'Content-Type' => 'text/plain'}, ['hello!']]
  end
end

run RackApplication.new
