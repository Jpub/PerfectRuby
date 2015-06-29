# coding: utf-8

class EvalTarget
  CONST_VAL = "EvalTarget::CONST"
  attr_accessor :instance_val
end

CONST_VAL = "CONST"

e1 = EvalTarget.new

# eval 블록 내에서 CONST_VAL을 참조해도 EvalTarget::CONST_VAL이 참조돼 버린다
e1.instance_eval { @instance_val = CONST_VAL }
e1.instance_val #=> "EvalTarget::CONST"

# CONST_VAL을 instance_exec의 인수로 전달하면, 해당 구문에 있는 CONST_VALUE를 참조할 수 있다
e1.instance_exec(CONST_VAL) {|const_val| @instance_val = const_val }
e1.instance_val #=> "CONST"
