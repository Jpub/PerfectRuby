# coding: utf-8

require 'fileutils'
require 'active_record'

module Todo

  # 데이터베이스 접속 모듈
  # @author sugamasao
  module DB

    # 데이터베이스 접속과 테이블 작성
    # @return [void]
    def self.prepare
      database_path = File.join(ENV['HOME'], '.todo', 'todo.sqlite3')

      connect_database database_path
      create_table_if_not_exists database_path
    end

    # 데이터베이스 접속
    # @param [String] path 접속할 데이터베이스 경로
    # @return [void]
    def self.connect_database(path)
      spec = {adapter: 'sqlite3', database: path}
      ActiveRecord::Base.establish_connection spec
    end


    # tasks 테이블 작성
    # @param [String] path 접속할 데이터베이스 경로
    # @return [void]
    def self.create_table_if_not_exists(path)
      create_database_path path

      connection = ActiveRecord::Base.connection

      return if connection.table_exists?(:tasks)

      connection.create_table :tasks do |t|
        t.column :name,    :string,  null: false
        t.column :content, :text,    null: false
        t.column :status,  :integer, default: 0, null: false
        t.timestamps
      end
      connection.add_index :tasks, :status
      connection.add_index :tasks, :created_at
    end
   

    # 데이터베이스 파일을 저장할 디렉터리 작성
    # @param [String] path 접속할 데이터베이스 경로
    # @return [void]
    def self.create_database_path(path)
      FileUtils.mkdir_p File.dirname(path)
    end

    private_class_method :connect_database, :create_table_if_not_exists, :create_database_path
  end

end

