# coding: utf-8

module PrependModule
  def prepended_method
    :prepended_method
  end
end

class PrependedClass
  prepend PrependModule
end

prepended_obj = PrependedClass.new
prepended_obj.prepended_method #=> :prepended_method
