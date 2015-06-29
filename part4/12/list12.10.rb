# ==Rubyist Class
#
# Rubyist.join_rubykaigi라는 클래스 메소드
# Rubyist#write_code라는 인스턴스 메소드
#
class Rubyist
  def self.join_rubykaigi
    RubyKaigiStaff.new
  end

  def write_code
    'writing'
  end
end
