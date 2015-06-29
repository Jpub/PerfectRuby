# coding: utf-8

eval 'p self'
object = Object.new

object.instance_eval { p self }
object.class.class_eval { p self }

Kernel.module_eval { p self }
