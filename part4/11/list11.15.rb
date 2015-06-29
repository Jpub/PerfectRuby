require 'stringio'

def capture_stdout
  captured = StringIO.new
  original = $stdout
  $stdout  = captured # 표준 출력을 StringIO 객체로 변경

  yield

  # 표준 출력을 원래대로 되돌리고, 캡처한 문자열을 반환
  $stdout = original
  captured.string
end

# puts한 내용을 캡처한다
captured_string = capture_stdout { puts 'Hi, STDOUT!!!' } # "Hi, STDOUT!!! \n"는 출력되지 않는다

p captured_string # => "Hi, STDOUT!!! \n"
