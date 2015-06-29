fib = Fiber.new {
  a, b = 0, 1

  loop do
    a, b = b, a + b

    Fiber.yield(a)
  end
}

10.times.map { fib.resume } # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
puts fib.resume # "89" 출력
puts fib.resume # "144" 출력
