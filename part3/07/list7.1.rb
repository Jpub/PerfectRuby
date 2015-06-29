# coding: utf-8

class QuotableString < String
  def quote
    "'#{self}'"
  end
end
