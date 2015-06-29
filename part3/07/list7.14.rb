# coding: utf-8

class EvalTarget
  attr_reader :instance_val

  private

  def private_method
    @instance_val = 100
  end
end

e1 = EvalTarget.new

e1.instance_eval do
  private_method
end

e1.instance_val #=> 100
