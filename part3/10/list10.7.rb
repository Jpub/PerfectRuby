# coding: utf-8

class Hello
  protected
  def protected_hello
    'protected hello'
  end

  private
  def private_hello
    'private hello'
  end
end

hello = Hello.new

hello.protected_hello
  #=> protected method `protected_hello' called for #<Hello:0x007fc04c04e3b8> (NoMethodError)
hello.send :protected_hello #=> 'protected hello'

hello.private_hello
  #=> private method `private_hello' called for #<Hello:0x007fe7c384f758> (NoMethodError)
hello.send :private_hello #=> 'private hello'
