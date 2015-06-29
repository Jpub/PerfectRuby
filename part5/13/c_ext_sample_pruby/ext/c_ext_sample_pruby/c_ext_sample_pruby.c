#include <ruby.h>

static VALUE print_hello(VALUE self) {
  return rb_str_new2("hello pruby!! from c ext");
}

void Init_c_ext_sample_pruby(void) {
  VALUE module = rb_define_module("CExtSamplePruby");

  rb_define_singleton_method(module, "c_ext_hello", print_hello, 0);
}
