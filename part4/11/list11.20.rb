require 'uri'
require 'net/http'

uri = URI.parse(ARGV.first)
Net::HTTP.start uri.host, uri.port do |http|
  response = http.get(uri.path)

  case response.code.to_i
  when 200
    puts response.body
  else
    puts %(#{response.code} #{response.message})
  end
end
