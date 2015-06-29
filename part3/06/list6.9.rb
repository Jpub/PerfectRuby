# coding: utf-8

# list6.8 코드
class InstanceCountClass
  @instance_count = 0 # 클래스 인스턴스 초기화

  def self.instance_count_up
    @instance_count += 1 if @instance_count
  end

  def self.instance_count
    @instance_count
  end

  def initialize
    self.class.instance_count_up
  end
end

class NewInstanceCountClass < InstanceCountClass
end

NewInstanceCountClass.instance_count #=> nil

5.times do
  NewInstanceCountClass.new
end

InstanceCountClass.instance_count #=> 5
NewInstanceCountClass.instance_count #=> nil
