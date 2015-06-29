require 'webrick'
require 'webrick/httpproxy'

# 포록시 서버 객체 만들기
proxy = WEBrick::HTTPProxyServer.new(
  :BindAddress => '127.0.0.1',
  :Port => 8080,
  # 프록시 관련 기능을 조금만 추가해 본다
  # 접속한 사이트의 타이틀을 출력한다
  :ProxyContentHandler =>
    ->(req, res) {
      puts res.body.scan(/<title>(.*)< \/title>/im).join rescue nil
    }
)

# Ctrl + C로 셧다운 하기 위해서 SIGINT를 포착한다
Signal.trap('INT') do
  # 포착한 경우 프록시를 셧다운한다
  proxy.shutdown
end

# 프록시 서버 시작
proxy.start
