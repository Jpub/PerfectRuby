# coding: utf-8

class SuperKlass
  def super_method
    self.class
  end
end

class Klass < SuperKlass
end

class NotInheritKlass
  def super_method
    self.class
  end
end

super_klass = SuperKlass.new
klass = Klass.new
not_inherit_klass = NotInheritKlass.new

# SuperKlass#super_method의 UnboundMethod 객체 생성
unbind_super_method = SuperKlass.instance_method(:super_method)

# bind하는 객체가 동일 클래스의 인스턴스이므로 실행된다
unbind_super_method.bind(super_klass).call
  # => SuperKlass

# bind하는 객체가 서브 클래스의 인스턴스이므로 실행된다
unbind_super_method.bind(klass).call
  # => Klass

# bind할 객체가 동명의 메소드를 가지고 있어도 SuperKlass의 서브 클래스이므로 TypeError
unbind_super_method.bind(not_inherit_klass).call
  # => :in `bind': bind argument must be an instance of SuperKlass (TypeError)
