require 'stringio'

def read_upcase(io)
  io.read.upcase
end

io       = open('|uname') # 윈도즈 환경에서 ver 등으로 바꿔서 실행하도로 한다
stringio = StringIO.new('alice')

p read_upcase(io)       # => "DARWIN \n"
p read_upcase(stringio) # => "ALICE"
