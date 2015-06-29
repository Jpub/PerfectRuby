# coding: utf-8

def what_class(obj)
  case obj
  when proc {|x| x.kind_of? String }
    String
  when proc {|x| x.kind_of? Numeric }
    Numeric
  else
    Class
  end
end

what_class "string" #=> String
what_class 1        #=> Numeric
what_class []       #=> Class
