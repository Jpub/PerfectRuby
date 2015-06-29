# coding: utf-8

class EvalTarget
  attr_reader :instance_val

  def initialize
    @instance_val = 0
  end
end

e1 = EvalTarget.new
e1.instance_val #=> 0

e1.instance_eval do
  @instance_val = 10
end

e1.instance_val #=> 10
