for item in %w(foo bar baz)
  Thread.fork do
    sleep 1   # 확실히 for루프가 끝날때까지 기다림

    puts item # 모든 스레드에서 "baz"라고 표시됨
  end
end

(Thread.list - [Thread.current]).each &:join # 자식 스레드 종료를 기다림
