require 'sinatra'

get '/' do
  erb :index
end

__END__

@@ index
<html>
  <body>
    <h1>Ruby Version = <%= RUBY_VERSION %></h1>
  </body>
</html>
