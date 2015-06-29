# coding: utf-8

class AttrClass
  def initialize
    @attr = "attr"
  end

  def add_reader(instance_val_name)
    eval <<-END_OF_DEF
      def #{instance_val_name}
        @#{instance_val_name}
      end
    END_OF_DEF
  end

  def add_writer(instance_val_name)
    eval <<-END_OF_DEF
      def #{instance_val_name}=(val)
        @#{instance_val_name} = val
      end
    END_OF_DEF
  end
end

attr_obj = AttrClass.new #=> #<AttrClass:0x007f94c404db60 @attr="attr">

attr_obj.respond_to? "attr" #=> false

attr_obj.add_reader "attr"

attr_obj.respond_to? "attr" #=> true
attr_obj.attr #=> "attr"

attr_obj.respond_to? "attr=" #=> false

attr_obj.add_writer "attr"

attr_obj.respond_to? "attr=" #=> true
attr_obj.attr = "new val" #=> "new val"
attr_obj.attr #=> "new val"
