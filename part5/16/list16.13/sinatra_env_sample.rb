require 'sinatra'

get '/' do
  puts "settings.production?  => #{settings.production?}"
  puts "settings.development? => #{settings.development?}"
  puts "settings.test?        => #{settings.test?}"

  "configure sample"
end

