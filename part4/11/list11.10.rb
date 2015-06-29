require 'csv'

data = <<EOS
  foo,bar,baz
  hoge,piyo,fuga
EOS

CSV.parse(data) do |row|
  puts row.join('|') # "foo|bar|baz" 등이 출력된다
end
