# coding: utf-8

class Klass
  @class_instance_val = :class_instance_val
  @@class_val = :class_val
end

class InheritKlass < Klass
  # InheritKlass에 정의된 클래스 인스턴스 변수에 접근 함
  @class_instance_val #=> nil

  # 부모 클래스의 클래스 변수는 참조할 수 있다
  @@class_val #=> :class_val
end
