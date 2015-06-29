# coding: utf-8

class Klass
  @class_instance_val = :class_instance_val
  @@class_val = :class_val

  def instance_method
    # 클래스 인스턴스 변수에 접근하는 것은, 인스턴스 변수에 접근하는 것이라고 해석된다
    @class_instance_val #=> nil

    # 클래스 변수에는 접근할 수 있다
    @@class_val #=> :class_val
  end
end
