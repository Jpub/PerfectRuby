# coding: utf-8

module IncludeModule
  def embeded_method
    :from_include_module
  end
end

module PrependModule
  def embeded_method
    :from_prepend_module
  end
end

class EmbeddedClass
  include IncludeModule
  prepend PrependModule
end

embeded_obj = EmbeddedClass.new
embeded_obj.embeded_method #=> :from_prepend_module
