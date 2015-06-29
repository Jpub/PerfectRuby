# coding: utf-8

class ParentClass
  def super_public_method; end

  private
  def super_private_method; end

  protected
  def super_protected_method; end
end

class ChildClass < ParentClass
  def public_method; end

  private
  def private_method; end

  protected
  def protected_method; end
end

ChildClass.instance_methods
  #=> [:public_method, :protected_method, :super_public_method, :super_protected_method, :nil?, ...]
ChildClass.public_instance_methods
  #=> [:public_method, :super_public_method, :nil?, ...]
ChildClass.private_instance_methods
  #=> [:private_method, :super_private_method, :initialize_copy, ...]
ChildClass.protected_instance_methods
  #=> [:protected_method, :super_protected_method]

ChildClass.method_defined? :public_method
  #=> true
ChildClass.method_defined? :private_method
  #=> false
ChildClass.method_defined? :protected_method
  #=> true
ChildClass.method_defined? :super_public_method
  #=> true

ChildClass.method_defined? :super_private_method
  #=> false
ChildClass.method_defined? :super_protected_method
  #=> true

ChildClass.public_method_defined? :public_method
  #=> true
ChildClass.private_method_defined? :private_method
  #=> true
ChildClass.protected_method_defined? :protected_method
  #=> true
