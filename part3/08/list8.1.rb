# coding: utf-8

def proc_factory
  Proc.new
end

block_proc = proc_factory { 'method block' } #=> #<Proc:0x007fc0e21981b0@(irb):4>
block_proc.call #=> 'method block'
