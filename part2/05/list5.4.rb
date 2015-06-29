for item in %w(foo bar baz)
  Thread.fork item do |value|
    sleep 1

    puts value # 모든 스레드에서 각 요소 값이 표시됨
  end
end

(Thread.list - [Thread.current]).each &:join # 자식 스레드 종료를 기다림
