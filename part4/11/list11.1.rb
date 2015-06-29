require 'thread'

queue = Queue.new

# 작업 스레드를 3개 준비한다
workers = 3.times.map { |t|
  Thread.fork {
    while req = queue.deq
      puts "Worker#{t} processing.."
      req.call
    end
  }
}

# 10개 요청을 enque한다
10.times do |t|
  queue.enq -> {
    sleep 1 # 어떤 처리
  }
end

# 모든 큐가 처리될 때까지 대기
sleep 1 until queue.empty?

# 큐가 비었기 떼문에 모든 스레드가 queue를 기다림
p workers.map(&:status)

# 다시 큐에 추가
3.times do |t|
  queue.enq -> {
    sleep 1 # 어떤 처리
  }
end

# 큐의 처리중 상태를 확인
p workers.map(&:status)

# 모든 큐가 처리될 때까지 기다림
sleep 1 until queue.empty?

