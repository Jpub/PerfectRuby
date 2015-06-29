# -*- coding: utf-8 -*- #
#
# == 인사를 위한 클래스 #
#

# @author joker1007
# @version 0.1.0
class HelloWorld
  # @abstract 추상 메소드이기 때문에 override해주세요
  def abstract_method
    raise NotImplementedError
  end

  # @deprecated 이 메소드의 사용을 자제해주세요
  def deprecated_method
    puts "deprecated"
  end

  # @example 메소드 예를 표시합니다
  #  example_method("given arg") # => "example given arg"
  def example_method(arg = "arg_sample")
    "example #{arg}"
  end

  # @note 여기는 중요한 설명입니다
  def note_method(arg = "arg_sample")
    "hello #{arg}"
  end

  # @option option [Symbol] :type 인사의 종류
  # @option option [Boolean] :hoching(true) 호칭을 붙일지 여부
  def korean(name = @reader, option = {hoching: true})
    greet = '안녕하세요'
    title = '님'

    greet = '안녕히 가세요' if option[:type] == :nim
    title = '' if option[:hoching]

    "#{greet} #{name}#{title}"
  end

  # @overload my_poke(lang, name = @reader)
  #   @param lang [String] 2 문자의 언어명 코드를 문자열로 표시한 것
  # @overload my_poke(lang, name = @reader)
  #   @param lang [Symbol] 2 문자의 언어명 코드를 심볼로 표시한 것
  # @raise [ArgumentError] 지정한 언어 코드에 대응하는 메소드가 존재하지 않으면 발생
  def my_poke(lang, name = @reader)
    case lang.to_sym
    when :ko
      korean name
    when :en
      english name
    when :es
      spanish name
    else
      raise ArgumentError
    end
  end

  # @param message [String] 인사 내용
  # @param friends [Array<String>] 인사 대상의 배열
  def hello_friends(message = "hello", friends = [])
    friends.each do |friend|
      puts "Hello #{friend}"
    end
  end

  # @param people [Array<Person>] 사람 이름 배열
  # @return [Person] 친구 이름
  # @return [nil] 친구를 찾을 수 없는 경우
  def find_friend(people = [])
    people.find(&:friend?)
  end

  # @see #spanish
  def hola(name = @reader)
    "Hola!! #{name}"
  end

  # @param name [String] 인사하는 사람의 이름
  # @return [String] 스페인어 인사
  # @since 0.0.2
  def spanish(name = @reader)
    "Hola!! #{name}"
  end

  # @yield [list] 랜덤으로 실행할 메소드를 선택하기 위한 필터
  # @yieldparam list [Array<Symbol>] 메소드명 심볼이 저장된 배열
  # @yieldreturn [Symbol] 선택된 메소드의 심볼
  def random_greet(name = @reader, method_list = [], &rule)
    method_list = [:english, :korean, :spanish] if method_list.empty?
    select_method = yield method_list
    self.send select_method.to_sym, name
  end

  # @!group Callbacks
  #
  def before_filter; end
  def after_filter; end

  # @!endgroup
def index; end
  # @!macro [new] hello_method
  #  @!method hello_$1
  #   @note $1에 인사한다
  #   @return [void]
  #   @!scope instance
  #   @!visibility private
  def self.define_hello_method(name)
    instance_eval do
      define_method("hello_#{name}") do
        puts "Hello #{name}"
      end
    end
    private("hello_#{name}")
  end

  define_hello_method :joker1007
  define_hello_method :ryopeko
end

class Person
  class << self
    def property(sym)
      attr_accessor sym
    end
  end

  # @!attribute [rw] name
  #   @return [String] 이름을 표시하는 문자열
  property :name

  # @todo 아직 개발 중이기 때문에 나중에 제대로 구현한다
  def friend?
    true
  end
end
