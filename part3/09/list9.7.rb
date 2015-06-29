# coding: utf-8

unbound_shift_operator = Array.instance_method(:<<) # => #<UnboundMethod: Array#<<>
unbound_shift_operator.arity # => 1
unbound_shift_operator.parameters # => [[:req]]
unbound_shift_operator.owner # => Array
unbound_shift_operator.name # => :<<
