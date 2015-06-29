def hello(names)
  names.each do |name |
    puts "HELLO, #{name.upcase}"
  end
end

rubies = ['MRI', 'jruby', 'rubinius']

hello(rubies)    # 순서대로"HELLO, MRI", "HELLO, JRUBY", "HELLO, RUBINIUS"를 출력
