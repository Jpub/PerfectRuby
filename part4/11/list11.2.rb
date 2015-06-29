require 'thread'

class Bucket
  def initialize(limit = 5)
    @appendable = ConditionVariable.new # 출력되기까지 기다리기 위한 것
    @flushable  = ConditionVariable.new # 줄 수가 일정 수에 도달하기까기 기다리는 것
    @lock  = Mutex.new # @out 잠금
    @limit = limit     # @out  줄 수가 @limit에 도달하면 @flushable이 됨
    @out   = ''        # 출력할 문자열
  end

  def append(str)
    @lock.synchronize {
      @appendable.wait(@lock) unless appendable?

      @out << str

      @flushable.signal if flashable?
    }
  end

  def flush
    @lock.synchronize {
      @flushable.wait(@lock) unless flashable?

      puts '-' * 10
      puts @out

      @out = ''
      @appendable.signal if appendable?
    }
  end

  private

  def appendable?
    @out.lines.count < @limit
  end

  def flashable?
    !appendable?
  end
end
