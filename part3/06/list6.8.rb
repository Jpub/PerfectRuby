# coding: utf-8

class InstanceCountClass
  @instance_count = 0 # 클래스 인스턴스 변수 초기화

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

5.times do
  InstanceCountClass.new
end

InstanceCountClass.instance_count #=> 5
