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

child = ChildClass.new
# 객체에 특이 클래스 정의
def child.singleton_method; end

child.methods
  #=> [:singleton_method, :public_method, :protected_method, :super_public_method, :super_protected_method, :nil?, ...]
child.public_methods
  #=> [:singleton_method, :public_method, :super_public_method, :nil?, ...]
child.private_methods
  #=> [:private_method, :super_private_method, :initialize_copy, ...]
child.protected_methods
  #=> [:protected_method, :super_protected_method]
child.singleton_methods
  #=> [:singleton_method]

child.methods(false)
  #=> [:singleton_method]

module AddSingletonMethodModule
  def singleton_method_from_add_singleton_method; end
end

child.extend AddSingletonMethodModule

child.singleton_methods
  #=> [:singleton_method, :singleton_method_from_add_singleton_method]

child.singleton_methods(false)
  #=> [:singleton_method]
child.methods(false)
  #=> [:singleton_method]

child.public_methods(false)
  #=> [:singleton_method, :public_method]
child.private_methods(false)
  #=> [:private_method]
child.protected_methods(false)
  #=> [:protected_method]
