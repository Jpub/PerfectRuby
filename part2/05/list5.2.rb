(0..Float::INFINITY).lazy.map { |n|
  puts "map: #{n}"
  n.succ
}.select { |n|
  puts "select: #{n}"
  n.odd?
}.take(3).force
