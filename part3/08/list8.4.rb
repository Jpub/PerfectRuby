# coding: utf-8

def convert_proc(&block)
  block
end

proc_obj = convert_proc { 1 } #=> #<Proc:0x007fce999a9858@(irb):4>
proc_obj.call                 #=> 1
