fiber = Fiber.new { |first|
  puts first

  second = Fiber.yield('goodbye')

  puts second

  'goodbye (again)'
}

puts fiber.resume('hello')
puts fiber.resume('hello (again)')
