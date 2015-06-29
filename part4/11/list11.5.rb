require 'fiber'

fr = Fiber.new { Fiber.yield }

# 파이버가 막 생성됐기 때문에 true 반환
p fr.alive? # => true

fr.resume

# Fiber.yield에 의해 돌아왔기 때문에, 아직 파이버가 살아 있는 상태여서 true 반환
p fr.alive? # => true

fr.resume

# 파이버가 종료됐기 때문에 false 반환
p fr.alive? # => false
