# coding: utf-8

class MethodUndefinedClass
  def first_method; end
  def second_method; end
  def third_method; end
  def forth_method; end

  class << self
    private
    def method_undefined(method_name)
      puts "method undefined: #{method_name}"
    end
  end
end

class MethodUndefinedClass
  undef_method :second_method, :third_method
end
