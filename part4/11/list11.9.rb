require 'csv'

csv = CSV.new(<<EOS)
foo,bar,baz
hoge,piyo,fuga
EOS

csv.each do |row|
  puts row.join('|') # "foo|bar|baz" 등이 출력된다
end
