# coding: utf-8

class RespondAtMethodMissing
  def method_missing(method_name, *args)
    if method_name == :respond_at_method_missing
      'respond_at_method_missing'
    else
      super
    end
  end
end

respond_at_method_missing = RespondAtMethodMissing.new
respond_at_method_missing.respond_at_method_missing #=> 'respond_at_method_missing'

respond_at_method_missing.respond_to? :respond_at_method_missing #=> false

# respond_to_missing?을 오버라이드
class RespondAtMethodMissing
  def respond_to_missing?(method_name, include_private = false)
    if method_name.to_sym == :respond_at_method_missing
      true
    else
      super
    end
  end
end

respond_at_method_missing.respond_to? :respond_at_method_missing #=> true
