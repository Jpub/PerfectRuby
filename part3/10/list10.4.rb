# coding: utf-8

class HasPrivateMethod
  private
  def private_method
    'private_method'
  end
end

has_private_method = HasPrivateMethod.new

has_private_method.respond_to? :private_method #=> false
has_private_method.respond_to? :private_method, true #=> true
# false를 지정하면 인수를 지정하지 않은 경우와 동일 처리
has_private_method.respond_to? :private_method, false #=> false
