# coding: utf-8

args_lambda = lambda {|x, y| [x, y] }
args_lambda[1, 2, 3] # => ArgumentError: wrong number of arguments (3 for 2)
args_lambda[1]       # => ArgumentError: wrong number of arguments (1 for 2)
args_lambda[[1, 2]]  # => ArgumentError: wrong number of arguments (1 for 2)
