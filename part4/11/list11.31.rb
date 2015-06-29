require 'erb'

include ERB::Util

p ERB.new(%(<%= h('<script></script>') %>)).result(binding)
# => "&lt;script&gt;&lt;/script&gt;"
p ERB.new(%(<%= u('http://google.com/') %>)).result(binding)
# => "http%3A%2F%2Fgoogle.com%2F"
