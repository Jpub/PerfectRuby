# coding: utf-8

require 'fileutils'
require 'active_record'

module Todo

  # データベースへの接続処理を扱うモジュール
  # @author sugamasao
  module DB

    # データベースへの接続とテーブルの作成を行う
    # @return [void]
    def self.prepare
      database_path = File.join(ENV['HOME'], '.todo', 'todo.sqlite3')

      connect_database database_path
      create_table_if_not_exists database_path
    end

    # データベースへの接続を行う
    # @param [String] path 接続を行うデータベースのパス
    # @return [void]
    def self.connect_database(path)
      spec = {adapter: 'sqlite3', database: path}
      ActiveRecord::Base.establish_connection spec
    end


    # tasksテーブルの作成を行う
    # @param [String] path 接続を行うデータベースのパス
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
   

    # データベースファイル保存先のディレクトリを作成する
    # @param [String] path 接続を行うデータベースのパス
    # @return [void]
    def self.create_database_path(path)
      FileUtils.mkdir_p File.dirname(path)
    end

    private_class_method :connect_database, :create_table_if_not_exists, :create_database_path
  end

end

