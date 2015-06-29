# -*- coding: utf-8 -*- #
#
# == 인사를 위한 클래스 #
#
# Author:: ryopeko
# Version:: 0.0.1
# License:: Ruby License

class Poke
  # 독자명이 저장된다
  attr_accessor :reader

  # 저자명이 저장된다
  attr_reader :authors

  #
  # 이 클래스의 버전
  #
  VERSION = '0.0.1'

  # @param [String] user_name 독자 이름
  # @return [Poke] Pokeインスタンス
  def initialize(user_name='you')
    @reader = user_name
    @authors = %w(sugamasao takkanm hibariya ryopeko)
  end

  # @param [String] name 인사하는 사람의 이름
  # @return [String] 영어 인사
  def english(name=@reader)
    "Hello #{name}"
  end
end
