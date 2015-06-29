# coding: utf-8

class MethodInfo
  def sample_method; end
end

obj = MethodInfo.new # => #<MethodInfo:0x007f9c0c917cd8>
sample_method = obj.method(:sample_method)

# Method객체의 메소드가 정의돼 있는 클래스와 모듈
sample_method.owner # => MethodInfo

# Method 객체의 메소드명
sample_method.name # => :sample_method

# Method 객체의 리시버
sample_method.receiver # => #<MethodInfo:0x007f9c0c917cd8>
sample_method.receiver == obj # => true
