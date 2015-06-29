require 'uri'
require 'net/http'

uri  = URI.parse('http://www.ruby-lang.org/ko/')
http = Net::HTTP.new(uri.host, uri.port)

http.start # HTTP 세션 개시
p http.active? # HTTP 세션이 시작됐는지 확인
http.finish # HTTP 세션 종료

http.start # HTTP 세션을 다시 개시(이미 개시돼 있으면 IOError)

# 접속 시 타이아웃 설정(초)
http.open_timeout = 30
p http.open_timeout # => 30

# 읽기 처리 시 타임아웃 설정(최대 시간을 초단위로 지정)
http.read_timeout = 60
p http.read_timeout # => 60
