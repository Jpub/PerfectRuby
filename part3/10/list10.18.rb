# coding: utf-8

class ChildClass
  class << self
    def class_method
    end
  end

  def instance_method
  end
end

ChildClass.methods
  #=> [:class_method, :allocate, ...]
ChildClass.methods(false)
  #=> [:class_method]
