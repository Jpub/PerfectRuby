# coding: utf-8

module HelloModule
  def hello
    :hello_module
  end
end

class GrandParentClass
  def hello
    :grand_parent_hello
  end
end

class ParentClass < GrandParentClass
  include HelloModule
end

class ChildClass < ParentClass
end

child = ChildClass.new
child.hello #=> ???
