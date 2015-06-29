# coding: utf-8

class Numeric
  def steps
    return [] if self <= 0

    0.upto(self).to_a
  end
end
