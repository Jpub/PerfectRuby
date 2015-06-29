require 'set'

a = %w(a b c d).to_set
b = %w(c d e f).to_set

# 양쪽 집합을 합한 것(합집합)
p a | b      # => #<Set: {"a", "b", "c", "d", "e", "f"}>
p a.union(b) # => #<Set: {"a", "b", "c", "d", "e", "f"}>

# 양쪽에 모두 존재하는 요소의 집합(교집합)
p a & b             # => #<Set: {"c", "d"}>
p a.intersection(b) # => #<Set: {"c", "d"}>

# 한 쪽에만 존재하는 요소의 집합（대칭 차집합）
p a ^ b # => #<Set: {"e", "f", "a", "b"}>

# a 집합에서 b집합에 있는 요소를 제외한 집합(차집합)
p a - b           # => #<Set: {"a", "b"}>
p a.difference(b) # => #<Set: {"a", "b"}>
