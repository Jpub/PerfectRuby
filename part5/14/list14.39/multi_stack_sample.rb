require 'pry'

module MultiStackSample
  def self.stackA
    stackB
  end

  def self.stackB
    binding.pry
    "stackB"
  end
end

MultiStackSample.stackA
