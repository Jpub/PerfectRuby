require 'sinatra/base'

class Application < Sinatra::Base
  get '/' do
    'Modular Style Sinatra!'
  end
end

Application.run!
