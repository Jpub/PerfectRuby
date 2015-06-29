# coding: utf-8

def yield_proc
  yield
end

proc_obj = Proc.new { 1 } #=> #<Proc:0x007fe1392bcee8@(irb):4>
yield_proc &proc_obj #=> 1
