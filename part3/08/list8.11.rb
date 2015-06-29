# coding: utf-8

args_proc = Proc.new {|x, y| [x, y] }
args_proc[1, 2, 3] # => [1, 2]
args_proc[1]       # => [1, nil]
args_proc[[1,2]]   # => [1, 2]
