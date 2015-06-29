require 'csv'

headers = %w(name age gender)
people = [
  ['alice', 14, 'female'],
  ['bob', 32, 'unknown'],
  ['carol', 17, 'female']
]

csv_string = CSV.generate('', write_headers: true, headers: headers) { |csv|
  people.each do |person|
    csv << person
  end
}

puts csv_string
