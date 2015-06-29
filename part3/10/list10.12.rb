# coding: utf-8

module IncludeModule
  MODULE_CONST_VAR = 1
end

class ConstantsClass
  include IncludeModule

  CLASS_CONST_VAR = 1

  class InnerClass
    INNER_CLASS_CONST_VAR = 1
  end
end

ConstantsClass.constants
  #=> [:CLASS_CONST_VAR, :InnerClass, :MODULE_CONST_VAR]
ConstantsClass.constants(false)
  #=> [:CLASS_CONST_VAR, :InnerClass]
ConstantsClass::InnerClass.constants
  #=> [:INNER_CLASS_CONST_VAR]
