require 'fiber'

p fr = Fiber.new { Fiber.current } # => #<Fiber:0x007fedd9880af8>
p fr_current = fr.resume # => #<Fiber:0x007fedd9880af8>

# fr 파이버와 fr가 반환하는 Fiber.current가 같기 때문에 true 반환
p fr == fr_current # => true

# 이 구문의 Fiber.current와 fr_current가 다르기 때문에 false 반환
p Fiber.current == fr_current # => false
