# coding: utf-8

class OriginalClass
end

obj = OriginalClass.new

def obj.new_singleton_method
  :new_singleton_method
end
