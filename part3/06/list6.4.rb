# coding: utf-8

class Klass
  # 클래스 인스턴스 변수 초기화
  # 단 이 방법으론 계승된 서브 클래스에선 초기화되지 않는다
  @class_instance_val = :class_instance_val

  def instance_method
    self.class.instance_variable_get :@class_instance_val #=> :class_instance_val
  end
end
