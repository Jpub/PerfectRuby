# coding: utf-8

Proc.new {|x, y| x }.call(1) #=> 1
lambda {|x, y| x }.call(1)   #=> ArgumentError: wrong number of arguments (1 for 2)
