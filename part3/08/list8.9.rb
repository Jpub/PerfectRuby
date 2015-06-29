# coding: utf-8

# Proc 객체 내의 break는 항상 에러
Proc.new { break 1 ; puts :unreachable }.call #=> LocalJumpError: break from proc-closure

def proc_break
  Proc.new { break 1 ; puts :unreachable }.call
end

proc_break #=> LocalJumpError: break from proc-closure

# lambda의 breaks는 return과 동일
lambda { break 1; puts :unreachable }.call #=> 1

def lambda_break
  lambda { break 1; puts :unreachable }.call
  :reachable
end

lambda_break #=> :reachable
