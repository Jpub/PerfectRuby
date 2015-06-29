# coding: utf-8

class HaveMethod
  def has_method
    'has_method'
  end
end

class NotHaveMethod
end

have_method = HaveMethod.new
not_have_method = NotHaveMethod.new

have_method.respond_to? :has_method #=> true
not_have_method.respond_to? :has_method #=> false
