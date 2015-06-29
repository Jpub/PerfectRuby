require 'uri'
require 'net/http'

# 웹 페이지를 취득해서 출력하는 예
uri = URI.parse('http://www.ruby-lang.org/ko/')

# get 사용 방법
print Net::HTTP.get(uri)

# get_print 사용 방법
Net::HTTP.get_print(uri)
