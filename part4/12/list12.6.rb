# -*- coding: utf-8 -*-
#
# ==인사를 위한 클래스
#
# Author:: ryopeko
# Version:: 0.0.1
# License:: Ruby License
#
class Poke
  # 독자명이 저장된다
  attr_accessor :reader

  # 저자명이 저장된다
  attr_reader :authors

  #
  # 이 클래스의 버전
  #
  VERSION = '0.0.1'

  #
  # ===initializer
  # initialize instance variables
  #
  def initialize(user_name='you')
    @reader = user_name
    @authors = %w(sugamasao takkanm hibariya ryopeko)
  end

  #
  # ===<em>@sugamasao</em>에게 인사하기 위한 메소드
  # 인스턴스화 하지 않아도 인사할 수 있기 때문에 <b>기분좋게</b> 인사할 수 있다
  #
  def self.sugamasao
    p 'Hey @sugamasao!'
  end

  #
  # ===<em>@takkanm</em>가 누군가에게 인사하기 위한 메소드
  # 대상을 인수로 지정
  # 인스턴스화해서 사용
  #
  def takkanm(screen_name='철수')
    p "#{screen_name}씨!"
  end

  #
  # === @hibariya에게 인사하기 위한 메소드
  # - 리스트1
  # - 리스트2
  # - 리스트3
  #
  def hibariya
    p '@hibariya'
    p bye
  end

  private

  #
  # === 작별 인사를 한다
  #
  def bye
    'Bye'
  end
end
