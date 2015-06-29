# coding: utf-8

class InstanceCountClass
  @@instance_count = 0

  def self.instance_count
    @@instance_count
  end

  def initialize
    @@instance_count += 1
  end
end

InstanceCountClass.instance_count #=> 0

5.times do
  InstanceCountClass.new
end

InstanceCountClass.instance_count #=> 5
