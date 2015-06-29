# coding: utf-8

class AddedMethodClass
  def before_added_method; end

  class << self
    private
    def method_added(method_name)
      puts "method added: #{method_name}"
    end
  end

  def after_added_method; end
  define_method :add_from_define_method, ->(){}
end

AddedMethodClass.class_eval do
  def add_from_class_eval; end
end
