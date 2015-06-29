# coding: utf-8

class MailSender
  attr_reader :from
  def initialize(from)
    @from = from
  end

  def send(to)
  "send mail: #{to}"
  end
end

mail_sender = MailSender.new('takkanm')

mail_sender.send 'takkanm@example.com' #=> 'send mail: takkanm@example.com'
mail_sender.__send__ :from #=> "takkanm"
