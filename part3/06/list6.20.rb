# coding: utf-8

module BeforeHelloFilter
  def hello
    "Hi! " + super
  end
end

class Hello
  prepend BeforeHelloFilter

  def hello
    "hello"
  end
end

Hello.new.hello #=> "Hi! hello"
