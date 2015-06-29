# coding: utf-8

module UnIncludedModule
  def un_included_module_method
    :un_included_module_method
  end
end

class Klass
  define_method :un_included_module_method, UnIncludedModule.instance_method(:un_included_module_method)
end
#=> TypeError: bind argument must be a subclass of UnIncludedModule
