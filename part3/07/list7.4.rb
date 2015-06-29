# coding: utf-8

class LoopMethodMissingClass
  def method_missing(name, *args)
    __send__(name)
  end
end

LoopMethodMissingClass.new.no_method # ???
