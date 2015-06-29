# coding: utf-8

# 메소드 내에서 return하면, Proc 객체의 return이 메소드의 return이 된다
def proc_return
  Proc.new { return 1; puts :unreachable }.call
  :unreachable # 이 값은 반환되지 않는다
end

proc_return #=> 1
# 메스드 밖에서 return하는 Proc 객체를 실행하면 에러
Proc.new { return 1; puts :unreachable }.call #=> LocalJumpError: unexpected return

# 일반 메소드와 동일한 동작
lambda { return 1; puts :unreachable }.call #=> 1

def lambda_return
  lambda { return 1; puts :unreachable }.call
  :reachable # lambda의 return에선 메소드를 빠져나가지 않기 때문에 여기가 반환값이 된다
end

lambda_return #=> :reachable
