# coding: utf-8

class Arity
  def arity_variable_length(*x); end
  def arity_variable_length_with_default_arg(x, *y); end
  def arity_default_val_1(x = 1); end
  def arity_default_val_2(x, y = 1); end
end

arity_obj = Arity.new
arity_obj.method(:arity_variable_length).arity                  # => -1
arity_obj.method(:arity_variable_length_with_default_arg).arity # => -2
arity_obj.method(:arity_default_val_1).arity                     # => -1
arity_obj.method(:arity_default_val_2).arity                    # => -2
