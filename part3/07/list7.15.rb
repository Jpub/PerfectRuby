# coding: utf-8

class EvalTarget
end

t1 = EvalTarget.new
t2 = EvalTarget.new

EvalTarget.class_eval do
  def class_method
    :class_method
  end
end

t1.class_method #=> :class_method
t2.class_method #=> :class_method

t1.instance_eval do
  def unique_method
    :unique_method
  end
end

t1.unique_method #=> :unique_method
t2.unique_method #=> undefined method `unique_method' for #<EvalTarget:0x007fd39284f338> (NoMethodError)
