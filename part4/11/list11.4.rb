require 'fiber'

f1 = Fiber.new {
  puts 'from f1'
}

f2 = Fiber.new {
  f1.transfer
  puts 'from f2' # 평가되지 않는다
}

f2.resume # => "from f1"
puts 'end'
