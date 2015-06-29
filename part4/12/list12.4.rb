IRB.conf[:PROMPT][:PRUBY] = {
  :PROMPT_I => "%N(pruby):%03n:%i> ",  # 일반 입력 대기 프롬프트
  :PROMPT_N => "%N(pruby):%03n:%i* ",  # 블록 내에서 연속되는 프롬프트
  :PROMPT_S => "%N(pruby):%03n:%i%l ", # 문자열 내의 프롬프트
  :PROMPT_C => "%N(pruby):%03n:%i* ",  # 연속 식의 프롬프트
  :RETURN => "pruby result => %s \n"   # 반환 값을 표시할 때 프롬프트
}
