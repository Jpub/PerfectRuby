# coding: utf-8

class AddedMethodClass
  private
  def singleton_method_added(method_name)
    puts "added_singleton_method: #{method_name}"
  end
end

obj = AddedMethodClass
def obj.add_from_singleton_method; end
