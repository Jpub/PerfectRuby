# coding: utf-8

class Klass
  @class_instance_val = :class_instance_val

  def self.class_instance_val
    @class_instance_val
  end
end

Klass.class_instance_val #=> :class_instance_val
