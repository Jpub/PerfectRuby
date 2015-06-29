require 'net/http'

proxy_class = Net::HTTP::Proxy('127.0.0.1', 8080)
http_proxy = proxy_class.new('www.ruby-lang.org')
http_proxy.start do |h |
  # 로컬 호스트의 프록시 경유로 접속
  h.get('/ko/')
end
