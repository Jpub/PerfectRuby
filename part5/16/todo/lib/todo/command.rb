# coding: utf-8

module Todo

  # コマンドラインベースの処理を行うクラスです
  # @author sugamasao
  class Command

    # アプリケーションの実行を行うためのショートカット
    # @param [Array] argv コマンドライン引数
    # @return [void]
    def self.run(argv)
      new(argv).execute
    end

    # コンストラクタ
    # 引数の解析処理を行う
    # @param [Array] argv コマンドライン引数
    def initialize(argv)
      @argv = argv
    end

    # Commandクラスの実際の処理を行います
    # エラーが発生した場合はエラーメッセージを表示して終了する
    # @return [void]
    def execute
      options     = Options.parse!(@argv)
      sub_command = options.delete(:command)

      # rackupして自前のWebインターフェイスを立ち上げる
      if sub_command == 'server'
        puts 'Start server process...'
        port_option = options[:port].nil? ? '' : "-p #{options[:port]}"

        config = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'config.ru'))
        exec "cd #{File.dirname(config)} && rackup -E production #{port_option} #{config}"

      end

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

    # データの作成処理
    # @param  [String] name    TODOタスクの名前
    # @param  [String] content TODOタスクの詳細
    # @return [Todo::Task] 作成されたレコード
    # @raise  [ActiveRecord::RecordInvalid] データ保存に失敗した場合
    def create_task(name, content)
      # タスク作成時のstatusはデフォルト値が使われNOT_YETとなる
      Task.create!(name: name, content: content).reload
    end

    # データの削除処理
    # @param  [Fixnum] id 削除するタスクのID
    # @return [Todo::Task] 削除されたレコード
    # @raise  [ActiveRecord::RecordNotFound] 指定したIDのレコードが存在しない場合
    def delete_task(id)
      task = Task.find(id)
      task.destroy
    end

    # データの更新処理
    # @param [Fixnum] id 更新するタスクのID
    # @param [Hash]   attributes 更新するタスクのデータ
    # @option attributes [String] :name 更新するタスク名
    # @option attributes [String] :content 更新するタスク内容
    # @option attributes [String] :status 更新するタスクステータス
    # @return [Todo::Task] 更新されたレコード
    # @raise  [ActiveRecord::RecordNotFound] 指定したIDのレコードが存在しない場合
    def update_task(id, attributes)
      if status_name = attributes[:status]
        attributes[:status] = Task::STATUS.fetch(status_name.upcase)
      end

      task = Task.find(id)
      task.update_attributes! attributes

      task.reload
    end

    # タスクをステータスの値で検索する
    # @param  [Fixnum, nil] status_name 検索条件の値(-sを省略した場合はnil)
    # @return [ActiveRecord::Relation] 検索条件に合致したレコード
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

    # Taskのレコードを整形して出力する
    # @param  [Todo::Task, ActiveRecord::Relation] tasks 出力するレコード
    # @return [void]
    def display_tasks(tasks)
      header = display_format('ID', 'Name', 'Content', 'Status')

      puts header
      puts '-' * header.size
      Array(tasks).each do |task|
        puts display_format(task.id, task.name, task.content, task.status_name)
      end
    end

    # Taskのレコードを整形する
    # @param  [Fixnum, String] id      レコードのid
    # @param  [String]         name    レコードのname
    # @param  [String]         content レコードのcontent
    # @param  [String]         status  レコードのstatus
    # @return [String] 表示用に整形された文字列
    def display_format(id, name, content, status)
      name_length    = 20 - full_width_count(name)
      content_length = 38 - full_width_count(content)
      [id.to_s.rjust(4), name.ljust(name_length), content.ljust(content_length), status.ljust(8)].join(' | ')
    end

    # 全角文字が何文字入っているかをカウントする
    # @param  [String] string カウント対象の文字列
    # @return [Fixnum] 全角文字の数
    def full_width_count(string)
      string.each_char.select{ |char| !(/[ -~｡-ﾟ]/.match(char)) }.count
    end
  end

end
