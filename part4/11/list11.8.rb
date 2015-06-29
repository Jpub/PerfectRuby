require 'json'

data = [1, 2.0, {'key' => 'value'}, nil, true, false]

# JSON으로 출력
# JSON.dump(data) 도 가능
p json = data.to_json # => "[1,2.0,{ \"key \": \"value \"},null,true,false]"

# 객체로 로드
p JSON.load(json) # => [1, 2.0, {"key"=>"value"}, nil, true, false]
