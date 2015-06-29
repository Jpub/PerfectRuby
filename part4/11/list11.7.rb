require 'yaml'

yaml_string = <<EOS
---
  remote:
    host: localhost
    port: 22
    ssh: true
    username: user
    password: null
EOS

# YAML을 객체로 로드
p setting = YAML.load(yaml_string)
# => {"remote"=>{"host"=>"localhost", "port"=>22, "ssh"=>true, "username"=>"user", "password"=>nil}}

# 내용 변경
setting['remote'].update('host' => 'example.com')

# 객체를 YAML으로 출력(YAML.dump 사용)
p YAML.dump(setting)
# => "---\nremote:\n host: example.com\n port: 22\n ssh: true\n username: user\n password: \n"

# 내용을 YAML으로 출력(Object#to_yaml 사용)
p setting.to_yaml # => （YAML.dump와 같은 결과）
