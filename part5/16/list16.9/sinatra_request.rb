require 'sinatra'

get '/' do
  puts "params                  => #{params}"
  puts "params.class            => #{params.class}"
  puts "request                 => #{request.inspect}"
  puts "request.class.ancestors => #{request.class.ancestors}"

  'request sample'
end
