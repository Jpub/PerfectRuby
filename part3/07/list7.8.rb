# coding: utf-8

class LoggingInstanceVariable
  logging_instance_val_names = %w(first_val second_val third_val)

  logging_instance_val_names.each do |val_name|
    eval <<-END_OF_DEF
      attr_reader :#{val_name}, :before_#{val_name}

      def #{val_name}=(val)
        @before_#{val_name} = @#{val_name}
        @#{val_name} = val
      end
    END_OF_DEF
  end
end

obj = LoggingInstanceVariable.new

obj.first_val = 1
obj.first_val = 2

obj.first_val #=> 2
obj.before_first_val #=> 1

obj.third_val = :third_val
obj.third_val = 'third_val'

obj.third_val #=> "third_val"
obj.before_third_val #=> :third_val
