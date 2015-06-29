# coding: utf-8

class Hello
  def hi
    'hi'
  end

  def hello(name)
    "hello #{name}"
  end
end

hello = Hello.new
hello.send :hi #=> hi
hello.send :hello, "takkanm" #=> 'hello takkanm'
