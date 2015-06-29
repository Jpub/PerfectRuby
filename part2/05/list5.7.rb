fiber = Fiber.new {
  puts 'Hello, Fiber'

  Fiber.yield

  puts 'Hello (again)'
}

fiber.resume # "Hello, Fiber" 출력

fiber.resume # "Hello (again)" 출력

fiber.resume # FiberError: dead fiber called
