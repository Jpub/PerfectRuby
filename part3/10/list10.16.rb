# coding: utf-8

module IncludeModule
end

class GrandParentClass
end

class ParentClass < GrandParentClass
  include IncludeModule
end

class ChildClass < ParentClass
end

ChildClass.ancestors
  #=> [ChildClass, ParentClass, IncludeModule, GrandParentClass, Object, Kernel, BasicObject]

ChildClass.included_modules #=> [IncludeModule, Kernel]

ChildClass.superclass #=> ParentClass
