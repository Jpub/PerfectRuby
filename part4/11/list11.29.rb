require 'erb'

erb = ERB.new('Hello, <%= str %>.')

kaigi = -> {
  str = 'RubyKaigi'

  binding
}

conf = -> {
  str = 'RubyConf'

  binding
}

p erb.result(kaigi.call()) # => "Hello, RubyKaigi."
p erb.result(conf.call())  # => "Hello, RubyConf."
