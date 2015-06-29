# coding: utf-8

# list6.6 코드
class InstanceCountClass
  @@instance_count = 0

  def self.instance_count
    @@instance_count
  end

  def initialize
    @@instance_count += 1
  end
end

class NewInstanceCountClass < InstanceCountClass
end

NewInstanceCountClass.instance_count #=> 5

5.times do
  NewInstanceCountClass.new
end

InstanceCountClass.instance_count #=> 10
NewInstanceCountClass.instance_count #=> 10
