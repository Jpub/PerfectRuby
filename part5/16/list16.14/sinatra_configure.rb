require 'sinatra'

configure do
  puts 'default configure'
end

configure :production do
  puts 'production configure'
end

configure :development, :test do
  puts 'development, test configure'
end

get '/' do
  'configure sample'
end
