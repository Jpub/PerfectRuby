# coding: utf-8

class Klass
  define_method :instance_method, -> { :instance_method }
end

object = Klass.new
object.instance_method #=> instance_method
