require 'benchmark'

n = 100000

Benchmark.benchmark(Benchmark::CAPTION, 7, Benchmark::FORMAT, '>total:', '>avg:') do |x |
  f = x.report("for:") { for i in 1..n; val = 'value' end }
  w = x.report("while:") { i = 1; while i <= n; val = 'value'; i += 1 end }
  t = x.report("times:") { n.times do val = 'value' end }
  total = f + w + t
  average = total / 3
  [total, average]
end
