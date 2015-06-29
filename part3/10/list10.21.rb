# coding: utf-8

class SuperClass
  def super_method
    :super_method
  end
end

class InheriteClass < SuperClass
  def super_method
    :inherite
  end
end

InheriteClass.new.super_method
  #=> :inherite
class InheriteClass
  undef_method :super_method
  #=> InheriteClass
end

InheriteClass.new.super_method
  #=> undefined method `super_method' for #<InheriteClass:0x007f9ac1908090> (NoMethdError)
