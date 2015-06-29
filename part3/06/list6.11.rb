# coding: utf-8

module IncludedModule
  def included_module_method
    :included_module_method
  end
end

class Klass
  include IncludedModule

  define_method :included_module_method, IncludedModule.instance_method(:included_module_method)
end

object = Klass.new
object.included_module_method #=> :included_module_method
