# coding: utf-8

class OverrideMethodMissing
  def method_missing(method_name, *args)
    if method_name == :target_method
      return 'target_method is called'
    end

    super
  end
end
