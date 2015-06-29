def countup
  File.open 'counter', File::RDWR | File::CREAT do |f|
    last_count = f.read.to_i

    f.rewind
    f.write last_count + 1
  end
end

10.times.map {
  Thread.fork { countup }
}.map(&:join)

puts File.read('counter').to_i # 10회 카운트돼야 하지만…
