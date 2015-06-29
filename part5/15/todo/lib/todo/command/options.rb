# coding: utf-8

require 'optparse'

module Todo

  class Command

    # 커맨드 라인 인수를 해석하는 모듈
    # @author sugamasao
    module Options

      # 커맨드 라인 인수를 해석한다
      # @param [Array<String>] argv 커맨드 라인 인수
      # @return [Hash] 커맨드 라인 인수를 해석한 결과
      def self.parse!(argv)
        options = {}

        sub_command_parsers = create_sub_command_parsers(options)
        command_parser      = create_command_parser

        # 인수 해석
        begin
          command_parser.order! argv

          options[:command] = argv.shift

          sub_command_parsers[options[:command]].parse! argv

          # update와 delete 는 id를 취득한다
          if %w(update delete).include?(options[:command])
            raise ArgumentError, "#{options[:command]} id not found." if argv.empty?
            options[:id] = Integer(argv.first)
          end
        rescue OptionParser::MissingArgument, OptionParser::InvalidOption, ArgumentError => e
          abort e.message
        end

        options
      end

      # 서브 명령용 OptionParser를 정의한다
      # @param  [Hash] options 객체가 지정될 때에 값을 저장하기 위한 객체
      # @return [Hash<OptionParser>]
      def self.create_sub_command_parsers(options)
        # 서브 명령을 처리할 때에 미정의 key가 지정되면 예외를 발생시킨다
        sub_command_parsers = Hash.new do |k, v|
          raise ArgumentError, "'#{v}' is not todo sub command."
        end

        # 서브 명령용 정의
        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.banner = 'Usage: create <args>'
          opt.on('-n VAL', '--name=VAL',    'task name')    {|v| options[:name]    = v }
          opt.on('-c VAL', '--content=VAL', 'task content') {|v| options[:content] = v }
          opt.on_tail('-h', '--help', 'Show this message')  {|v| help_sub_command(opt) }
        end

        sub_command_parsers['list'] = OptionParser.new do |opt|
          opt.banner = 'Usage: list <args>'
          opt.on('-s VAL', '--status=VAL',  'list status')  {|v| options[:status]  = v }
          opt.on_tail('-h', '--help', 'Show this message')  {|v| help_sub_command(opt) }
        end

        sub_command_parsers['update'] = OptionParser.new do |opt|
          opt.banner = 'Usage: update id <args>'
          opt.on('-n VAL', '--name=VAL',    'update name')    {|v| options[:name]    = v }
          opt.on('-c VAL', '--content=VAL', 'update content') {|v| options[:content] = v }
          opt.on('-s VAL', '--status=VAL',  'update status')  {|v| options[:status]  = v }
          opt.on_tail('-h', '--help', 'Show this message')    {|v| help_sub_command(opt) }
        end

        sub_command_parsers['delete'] = OptionParser.new do |opt|
          opt.banner = 'Usage: delete id'
          opt.on_tail('-h', '--help', 'Show this message') {|v| help_sub_command(opt) }
        end

        sub_command_parsers
      end

      # todo 커맨드 자체 인수를 처리하는 OptionParser 작성
      # @return [OptionsParser]
      def self.create_command_parser
        OptionParser.new do |opt|
          sub_command_help = [
            {name: 'create -n name -c content',              summary: 'Create Todo Task'},
            {name: 'update id -n name -c content -s status', summary: 'Update Todo Task'},
            {name: 'list   -s status',                       summary: 'List   Todo Tasks'},
            {name: 'delete id',                              summary: 'Delete Todo Task'}
          ]

          opt.banner = "Usage: #{opt.program_name} [-h|--help] [-v|--version] <command> [<args>]"
          opt.separator ''
          opt.separator "#{opt.program_name} Available Commands:"
          sub_command_help.each do |command|
            opt.separator [opt.summary_indent, command[:name].ljust(40), command[:summary]].join(' ')
          end

          opt.on_head('-h', '--help', 'Show this message') do |v|
            puts opt.help
            exit
          end

          opt.on_head('-v', '--version', 'Show program version') do |v|
            opt.version = Todo::VERSION
            puts opt.ver
            exit
          end
        end
      end

      # 서브 명령의 도움말 메시지를 출력하고 프로그램을 종료한다
      # @param [OptionParser] parser -h/--help를 처리하는 서브 명령의 OptionParser
      def self.help_sub_command(parser)
        puts parser.help
        exit
      end

      private_class_method :create_sub_command_parsers, :create_command_parser, :help_sub_command
    end

  end

end
