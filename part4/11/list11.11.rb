require 'csv'

data = <<EOS
  name,age,gender
  alice,14,female
  bob,32,male
  carol,17,female
EOS

CSV.parse(data, headers: :first_row) do |row|
  # 헤더명을 키로해서 해쉬처럼 값을 참조할 수 있다
  name = row['name']
  age, gender = row.values_at('age', 'gender')

  puts "#{name} is #{gender} (#{age})" # => alice is female (14) 등을 출력
end
