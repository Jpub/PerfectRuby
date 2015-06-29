require 'rack'

class RackApplication
  def call(env)
    request = Rack::Request.new(env)

    response = if request.path_info == '/'
                 body = "#{request.request_method}: Hello! #{request.params['name']}!"
                 Rack::Response.new(body, 200, {'Content-Type' => 'text/plain'})
               else
                 Rack::Response.new('Not Found', 404, {'Content-Type' => 'text/plain'})
               end

    response.finish
  end
end

run RackApplication.new
