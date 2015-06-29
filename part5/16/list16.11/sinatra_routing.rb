require 'sinatra'

get '/:name' do
  "Hi #{params[:name]}"
end
