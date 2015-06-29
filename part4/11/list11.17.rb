require 'set'

set = %w(Alice Bob Charlie Dave Ellen Frank Eve).to_set

p set.divide { |v | v.length }
# => #<Set: {#<Set: {"Alice", "Ellen", "Frank"}>, #<Set: {"Bob", "Eve"}>, #<Set: {"Charlie"}>,
#<Set: {"Dave"}>}>
