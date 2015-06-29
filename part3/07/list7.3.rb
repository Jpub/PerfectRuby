# coding: utf-8

class DelegateArray
  def initialize
    @array = []
  end

  def method_missing(name, *args)
    @array.__send__ name, *args
  end
end
