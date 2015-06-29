require 'pry'

module DebuggerSample
  def self.conditional_print(obj, condition)
    if condition
      p obj
    end
  end
end

binding.pry
DebuggerSample.conditional_print([1, 2, 3], true)
