# coding: utf-8

add = Proc.new {|x, y| x + y } #=> #<Proc:0x007fad3b90c758@(irb):1>
inc = add.curry.(1) #=> #<Proc:0x007fad3b2fb468>

inc.(2) #=> 3

append_prefix_atmark = add.curry.("@") #=> #<Proc:0x007fad3b910d08>
append_prefix_atmark.("takkanm") #=> "@takkanm"
