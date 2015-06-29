# coding: utf-8

module IncludedCount
  class << self
    def included(klass)
      @included ||= []
      @included << klass
    end

    def included_module_and_class
      @included
    end

    def included_count
      @included ? @included.count : 0
    end
  end
end

IncludedCount.included_count
  #=> 0

# 3회 클래스를 include한다
class IncludeClass1
  include IncludedCount
end

class IncludeClass2
  include IncludedCount
end

class IncludeClass3
  include IncludedCount
end

IncludedCount.included_count
  #=> 3
IncludedCount.included_module_and_class
  #=> [IncludeClass0, IncludeClass1, IncludeClass2]
