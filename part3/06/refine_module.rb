# coding: utf-8

module RefineModule
  refine String do
    def hello
      puts "#{self} hello"
    end
  end
end
