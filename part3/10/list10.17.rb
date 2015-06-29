# coding: utf-8

Module.nesting #=> []

module OutsideModule
  Module.nesting #=> [OutsideModule]
  class InnerClass
    Module.nesting #=> [OutsideModule::InnerClass, OutsideModule]
    class InnerInnerClass
      Module.nesting #=> [OutsideModule::InnerClass::InnerInnerClass, OutsideModule::InnerClass, OutsideModule]
    end
  end
end

class OutsideModule::InnerClass
  Module.nesting #=> [OutsideModule::InnerClass]
end

# class_eval 구문 내에선 ゙Module.nesting이 빈 데이터가 된다
OutsideModule::InnerClass.class_eval do
  Module.nesting #=> []
end
