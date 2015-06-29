require 'erb'

people = %w(Alice Bob Charlie)
erb    = ERB.new(<<-EOS)
<% people.each do |person | %>
* <%= person %>
<% end %>
EOS

erb.run binding
