IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:ECHO] = true
IRB.conf[:PROMPT][:PRUBY] = {
  :PROMPT_I => "%N(pruby):%03n:%i> ",
  :PROMPT_S => "%N(pruby):%03n:%i%l ",
  :PROMPT_C => "%N(pruby):%03n:%i* ",
  :RETURN => "pruby result => %s \n"
}
IRB.conf[:PROMPT_MODE] = :PRUBY
