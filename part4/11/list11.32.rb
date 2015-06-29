require 'benchmark'

n = 100000

Benchmark.bm do |x|
  x.report("for:") { for i in 1..n; val = 'value' end }
  x.report("while:") { i = 1; while i <= n; val = 'value'; i += 1 end }
  x.report("times:") { n.times do val = 'value' end }
end
