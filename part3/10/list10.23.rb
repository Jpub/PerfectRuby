# coding: utf-8

module ExtendedCount
  class << self
    def extended(obj)
      @extended ||= []
      @extended << obj
    end

    def extended_objects
      @extended
    end

    def extended_count
      @extended ? @extended.count : 0
    end
  end
end

ExtendedCount.extended_count
  #=> 0

5.times do
  Object.new.extend ExtendedCount
end

ExtendedCount.extended_count
  #=> 5
ExtendedCount.extended_objects
  #=> [#<Object:0x007fb491883158>, #<Object:0x007fb4918830b8>, #<Object:0x007fb491883040>, #<Object:0x007fb491882fc8>, #<Object:0x007fb491882f50>]
