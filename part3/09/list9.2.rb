# coding: utf-8

class Arity
  def arity_0; end
  def arity_1(x); end
  def arity_2(x, y); end
end

arity_obj = Arity.new
arity_obj.method(:arity_0).arity # => 0
arity_obj.method(:arity_1).arity # => 1
arity_obj.method(:arity_2).arity # => 2
