# coding: utf-8

class EvalTarget
  def initialize
    @instance_val = 'instance valiable'
  end

  def instance_binding
    local_val = 'local valiable'
    binding
  end

  private

  def private_method
    'private method'
  end
end

e1 = EvalTarget.new
binding_obj = e1.instance_binding

eval "@instance_val", binding_obj #=> "instance valiable"
eval "local_val", binding_obj #=> "local valiable"
eval "private_method", binding_obj #=> "private method"
