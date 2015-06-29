# coding: utf-8

class InheritedTiming
  class << self
    private

    def self.inherited(subclass)
      p subclass.ancestors
      p subclass.instance_methods.include? :super_method
      p subclass.instance_methods.include? :subclass_method
    end
  end

  def super_method
  end
end

puts "클래스 정의식 앞"

class InheritedTimingSubClass < InheritedTiming
  puts "클래스 정의식 뒤"

  def subclass_method
  end
end

p InheritedTimingSubClass.instance_methods.include? :super_method
p InheritedTimingSubClass.instance_methods.include? :subclass_method
