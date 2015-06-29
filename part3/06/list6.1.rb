# coding: utf-8

klass_object = nil

ThirdClass = Class.new do |klass|
  klass_object = klass
  klass == self #=> 이 식은 true가 된다

  def hello
    :hello
  end
end #=> ThirdClass

klass_object == ThirdClass #=> true

third_class_instance = ThirdClass.new #=> #<ThirdClass:0x007f9b5b15c158>
third_class_instance.hello #=> :hello
