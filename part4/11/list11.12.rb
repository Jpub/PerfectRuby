require 'csv'

converter = ->(field, field_info) {
  if field_info.index == 1
    field.upcase rescue field
  else
    field
  end
}

p CSV.parse(%(foo,bar,baz), converters: converter) # => [["foo", "BAR", "baz"]]
