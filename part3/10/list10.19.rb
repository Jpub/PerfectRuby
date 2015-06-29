# coding: utf-8

class RemovedMethodClass
  def first_method; end
  def second_method; end
  def third_method; end
  def forth_method; end
end

RemovedMethodClass.instance_methods(false)
  #=> [:first_method, :second_method, :third_method, :forth_method]

RemovedMethodClass.class_eval do
  remove_method :second_method, :third_method
  #=> RemovedMethodClass
end

RemovedMethodClass.instance_methods(false)
  #=> [:first_method, :forth_method]

RemovedMethodClass.class_eval do
  remove_method :fifth_method
    #=> in `remove_method': method `fifth_method' not defined in RemovedMethodClass (NameError)
end
