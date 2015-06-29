# coding: utf-8

class SuperClass
  def super_method
    :super_method
  end

  def super_method_for_over_write
    :super_method_for_over_write
  end
end

class InheriteClass < SuperClass
  def super_method_for_over_write
    :over_write
  end
end


InheriteClass.new.super_method
  #=> :super_method
InheriteClass.new.super_method_for_over_write
  #=> :over_write

class InheriteClass
  remove_method :super_method_for_over_write
end

InheriteClass.new.super_method_for_over_write
  #=> :super_method_for_over_write

class InheriteClass
  remove_method :super_method
    #=> method `super_method' not defined in InheriteClass (NameError)
end
