# coding: utf-8

require 'active_record'

module Todo

  # tasks 테이블을 표현하는 모델 클래스
  # @author sugamasao
  class Task < ActiveRecord::Base
    scope :status_is, ->(status) { where(status: status) }

    NOT_YET = 0 # 태스크가 미완료 상태

    DONE    = 1 # 태스크가 완료됐다

    PENDING = 2 # 유보 상태의 태스크

    # 상태 명칭과 값의 조합
    STATUS = {
      'NOT_YET' => NOT_YET,
      'DONE'    => DONE,
      'PENDING' => PENDING
    }.freeze

    validates :name,    presence:     true, length: {maximum: 140}
    validates :content, presence:     true
    validates :status,  numericality: true, inclusion: {in: STATUS.values}

    # status 문자열 반환
    # @return [String] 현재 status를 문자열로 반환
    def status_name
      STATUS.key(self.status)
    end
  end

end
