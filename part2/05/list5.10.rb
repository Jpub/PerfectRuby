require 'socket'

Process.daemon # 프로세스를 데몬으로 동작시킨다

TCPServer.open 'localhost', 4423 do |server|
  loop do
    client = server.accept # 클라이어트 접속을 기다림

    client.puts Time.now   # 현재 시간 반환

    client.close
  end
end
