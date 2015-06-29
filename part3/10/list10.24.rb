# coding: utf-8

class SuperClass
  class << self
    def inherited(subclass)
      @classes ||= []
      @classes << subclass
    end

    def subclasses
      @classes
    end
  end
end

SuperClass.subclasses
  #=> nil

class Sub1 < SuperClass; end
class Sub2 < SuperClass; end
class Sub3 < SuperClass; end

SuperClass.subclasses
  #=> [Sub1, Sub2, Sub3]
