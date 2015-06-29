require 'erb'

erb = ERB.new(<<-EOS)
<% if true %>True!!<% else %>False!!<% end %>
EOS

erb.run binding # "True!!" 출력
