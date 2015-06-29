# coding: utf-8

module FirstIncludeModule
  def same_name_method
    :first_included_module
  end
end

module SecondIncludeModule
  def same_name_method
    :second_included_module
  end
end

class Klass
  include FirstIncludeModule
  include SecondIncludeModule
end

object = Klass.new
object.same_name_method #=> :second_included_module
