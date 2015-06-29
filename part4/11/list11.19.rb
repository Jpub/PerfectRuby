require 'set'

a = %w(Alice Bob Charlie).to_set
b = %w(Alice Bob).to_set

p a.superset?(b)        # => true (a는 b의 상위 집합)
p b.subset?(a)          # => true (b는 a의 부분집합)
p a.proper_superset?(b) # => true (a는 b의 실제 상위 집합)
p b.proper_subset?(a)   # => true (b는 a의 실제 부분 집합)

p b.superset?(a) # => false (b는 a의 상위 집합이 아니다)
p a.subset?(b)   # => false (a는 b의 부분 집합이 아니다)

p a.subset?(a)   # => true (a는 a의 부분 집합)
p a.superset?(a) # => true (a는 a의 상위 집합)

p a.proper_superset?(a) # => false (a는 a의 실제 상위 집합이 아니다)
p a.proper_subset?(a)   # => false (a는 a의 실제 부분 집합이 아니다)
