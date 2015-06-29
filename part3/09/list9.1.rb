# coding: utf-8

class Dog
  def bark
    puts 'wan!!'
  end
end

dog = Dog.new
bark_wan = dog.method(:bark)

# Method객체를 취득한 메소드를 변경한다
class Dog
  def bark
    puts 'bowwow!!'
  end
end

# dog객체의 bark 메소드는 변경한 결과가 반영돼 있다
dog.bark # => bowwow!!

# Method 객체에는 메소드 변경이 영향을 주지 않는다
bark_wan.call # => wan!!

# Method 객체를 취득한 메소드를 특이 메소드로 변경
def dog.bark
  puts 'kyankyan!!'
end

dog.bark # => kyankyan!!

# Method 객체에는 변경이 영향을 주지 않는다
bark_wan.call # => wan!!
