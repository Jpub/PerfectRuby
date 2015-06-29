# coding: utf-8

class HaveInstanceVal
  def initialize
    @foo = 1
    @bar = 2
  end
end

have_instance_val = HaveInstanceVal.new

have_instance_val.instance_variables #=> [:@foo, :@bar]


have_instance_val.instance_variables.any? do |instance_val_name|
  instance_val_name =~ /fo/
end
  #=> true
have_instance_val.instance_variables.select do |instance_val_name|
  instance_val_name =~ /fo/
end
  #=> [:@foo]

have_instance_val.instance_variable_defined? :@foo #=> true
have_instance_val.instance_variable_defined? :@buzz #=> false
have_instance_val.instance_variable_defined? :foo
  #=> :in `instance_variable_defined?': `foo' is not allowed as an instance variable name (NameError)

have_instance_val.instance_variable_get :@foo #=> 1
have_instance_val.instance_variable_get :@buzz #=> nil
have_instance_val.instance_variable_get :foo
  #=> :in `instance_variable_get': `foo' is not allowed as an instance variable name (NameError)

have_instance_val.instance_variable_get :@foo #=> 1
have_instance_val.instance_variable_set :@foo, 2 #=> 2
have_instance_val.instance_variable_get :@foo #=> 2

have_instance_val.instance_variable_defined? :@buzz #=> false
have_instance_val.instance_variable_set :@buzz, 3 #=> 3
have_instance_val.instance_variable_defined? :@buzz #=> true
have_instance_val.instance_variables #=> [:@foo, :@bar, :@buzz]
