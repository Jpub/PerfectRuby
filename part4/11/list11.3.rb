require_relative 'list11.2'

bucket = Bucket.new

# 어떠한 처리를 해서 bucket에 결과를 기록
t1 = Thread.fork {
  25.times do |t |
    sleep rand # 처리게 걸리는 상세 시간
    bucket.append "line: #{t} \n"
  end
}

# bucket에 기록된 처리 결과를 일정 수만큼 출력
t2 = Thread.fork {
  5.times do
    bucket.flush
  end
}

[t1, t2].map(&:join)
