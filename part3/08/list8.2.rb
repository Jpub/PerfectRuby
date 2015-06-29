# coding: utf-8

def proc_factory
  Proc.new
end

proc_factory #=> ArgumentError: tried to create Proc object without a block
