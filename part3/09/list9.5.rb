# coding: utf-8

class KeywordArgs
  def normal_method_allow_keyword_args(first_arg, second_arg, third_arg)
    [first_arg, second_arg, third_arg]
  end

  private

  def method_missing(name, *args)
    # 메소드명에 _allow_keyword_args를 붙인 메소드가 없으면 처리하지 않는다
    method_name = name.to_s + '_allow_keyword_args'
    super unless respond_to? method_name

    args_hash = args.first

    # Method.parameters의 반환 값을 앞에서부터 처리해서
    # _allow_keyword_args가 없는 메소드를 호출할 시에 지정된 인수를
    # _allow_keyword_args가 있는 메소드 호출에 일치시킨다
    new_args = self.method(method_name).parameters.map do |(req, arg_name)|
      args_hash[arg_name]
    end
    __send__ method_name, *new_args
  end
end

KeywordArgs.new.normal_method(third_arg: 1, first_arg: 2, second_arg: 3) # => [2, 3, 1]
