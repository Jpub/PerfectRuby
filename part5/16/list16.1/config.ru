require 'rack'

class RackApplication
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ['hello!']]
  end
end

run RackApplication.new
