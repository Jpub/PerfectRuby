# coding: utf-8

class ClassVariables
  @@class_variable = :class_variable

  def define_lazy_class_variable
    @@lazy_class_variable = :lazy_class_variable
  end
end

ClassVariables.class_variables #=> [:@@class_variable]
ClassVariables.new.define_lazy_class_variable
ClassVariables.class_variables #=> [:@@class_variable, :@@lazy_class_variable]

ClassVariables.class_variable_defined? '@@class_variable' #=> true
ClassVariables.class_variable_defined? '@@undefined_class_variable' #=> false

ClassVariables.class_variable_get '@@class_variable' #=> :class_variable
ClassVariables.class_variable_get '@@undefined_class_variable'
  #=> in `class_variable_get': uninitialized class variable @@undefined_class_variable in ClassVariables (NameError)

ClassVariables.class_variable_set '@@class_variable', :class_variable_set
  #=> :class_variable_set
ClassVariables.class_variable_get '@@class_variable'
  #=> :class_variable_set

ClassVariables.class_variable_get '@@undefined_class_variable'
  #=> in `class_variable_get': uninitialized class variable @@undefined_class_variable in ClassVariables (NameError)
ClassVariables.class_variable_set '@@undefined_class_variable', :defined
  #=> :defined
ClassVariables.class_variable_get '@@undefined_class_variable'
  #=> :defined
