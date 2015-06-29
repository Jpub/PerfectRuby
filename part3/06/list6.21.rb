# coding: utf-8

module FirstPrependModule
  def prepended_method
    :first_prepend_module
  end
end

module SecondPrependModule
  def prepended_method
    :second_prepend_method
  end
end

class PrependedClass
  prepend FirstPrependModule
  prepend SecondPrependModule
end

prepended_obj = PrependedClass.new
prepended_obj.prepended_method # => :second_prepend_method
