# coding: utf-8

module Todo

  # 커맨드 라인 기반 처리를 위한 클래스
  # @author sugamasao
  class Command

    # 애플리케이션 실행을 위한 단축키
    # @param [Array] argv 커맨드 라인 인수
    # @return [void]
    def self.run(argv)
      new(argv).execute
    end

    # 생성자
    # 인수 해석
    # @param [Array] argv 커맨드 라인 인수
    def initialize(argv)
      @argv = argv
    end

    # Command 클래스의 실제 처리
    # 에러가 발생하면 에러 메시지 표시 후 종료
    # @return [void]
    def execute
      options     = Options.parse!(@argv)
      sub_command = options.delete(:command)

      DB.prepare

      tasks = case sub_command
              when 'create'
                create_task(options[:name], options[:content])
              when 'delete'
                delete_task(options[:id])
              when 'update'
                update_task(options.delete(:id), options)
              when 'list'
                find_tasks(options[:status])
              end
      display_tasks tasks

    rescue => e
      abort "Error: #{e.message}"
    end

    # 데이터 작성 처리
    # @param  [String] name    TODO 태스크 명칭
    # @param  [String] content TODO 태스크 상세
    # @return [Todo::Task] 작성된 레코드
    # @raise  [ActiveRecord::RecordInvalid] 데이터 저장에 실패한 경우
    def create_task(name, content)
      # 태스크 작성 시의 status는 기본값인 NOT_YET이 사용된다
      Task.create!(name: name, content: content).reload
    end

    # 데이터 삭제 처리
    # @param  [Fixnum] id 삭제할 태스크 ID
    # @return [Todo::Task] 삭제된 레코드
    # @raise  [ActiveRecord::RecordNotFound] 지정한 ID 레코드가 존재하지 않는 경우
    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end

    # 데이터 변경 처리
    # @param [Fixnum] id 변경할 태스크 ID
    # @param [Hash]   attributes 변경할 태스크 데이터
    # @option attributes [String] :name 변경할 태스크명
    # @option attributes [String] :content 변경할 태스크 내용
    # @option attributes [String] :status 변경할 태스크 상태
    # @return [Todo::Task] 변경된 레코드
    # @raise  [ActiveRecord::RecordNotFound] 지정한 ID 레코드가 존재하지 않는 경우
    def update_task(id, attributes)
      if status_name = attributes[:status]
        attributes[:status] = Task::STATUS.fetch(status_name.upcase)
      end

      task = Task.find(id)
      task.update_attributes! attributes

      task.reload
    end

    # 태스크 상태를 값으로 검색
    # @param  [Fixnum, nil] status_name 검색 조건 값(-s를 생략하면 nil)
    # @return [ActiveRecord::Relation] 검색 조건에 일치하는 레코드
    def find_tasks(status_name)
      all_tasks = Task.order('created_at DESC')

      if status_name
        status = Task::STATUS.fetch(status_name.upcase)
        all_tasks.status_is(status)
      else
        all_tasks
      end
    end

    private

    # Task 레코드를 다듬어서 출력
    # @param  [Todo::Task, ActiveRecord::Relation] tasks 출력할 레코드
    # @return [void]
    def display_tasks(tasks)
      header = display_format('ID', 'Name', 'Content', 'Status')

      puts header
      puts '-' * header.size
      Array(tasks).each do |task|
        puts display_format(task.id, task.name, task.content, task.status_name)
      end
    end

    # Task 레코드를 다듬는다
    # @param  [Fixnum, String] id      레코드 id
    # @param  [String]         name    레코드 name
    # @param  [String]         content 레코드 content
    # @param  [String]         status  레코드 status
    # @return [String] 표시용으로 다듬어진 문자열
    def display_format(id, name, content, status)
      name_length    = 20 - full_width_count(name)
      content_length = 38 - full_width_count(content)
      [id.to_s.rjust(4), name.ljust(name_length), content.ljust(content_length), status.ljust(8)].join(' | ')
    end

    # 전각 문자가 몇 글자있는지 센다
    # @param  [String] string 카운트 대상 문자열
    # @return [Fixnum] 전각 문자
    def full_width_count(string)
      string.each_char.select{ |char| !(/[ -~｡-ﾟ]/.match(char)) }.count
    end
  end

end
