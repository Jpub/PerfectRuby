# coding: utf-8

class HasConstans
  CONST_VARIABLE = 1
end

HasConstans.const_get :CONST_VARIABLE
  #=> 1
HasConstans.const_get :UNDEFINE_CONST_VARIABLE
  #=> `const_get': uninitialized constant HasConstans::UNDEFINE_CONST_VARIABLE (NameError)
HasConstans.const_get :not_const_variable
  #=> `const_get': wrong constant name not_const_variable (NameError)
