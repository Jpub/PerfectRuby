# coding: utf-8

add = Proc.new { | x, y | x + y } #=> #<Proc:0x007fd59b93b610@(irb):1>
inc = Proc.new {|y| add.(1, y) } #=> => #<Proc:0x007fd59c057de0@(irb):4>

inc.(1) #=> 2
