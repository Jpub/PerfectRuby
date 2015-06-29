require 'set'

set = [4, 4.0, 2, 3.0, 'Alice', 'Bob', 'Charlie', 4..10, 10..12].to_set

p set.classify { |v | v.class }
# => {Fixnum=>#<Set: {4, 2}>, Float=>#<Set: {4.0, 3.0}>, String=>#<Set: {"Alice", "Bob","Charlie"}>, Range=>#<Set: {4..10, 10..12}>}
