class FeedbackMailer < ApplicationMailer

  def feedback_email(message)
    @name = message[:name]
    @email = message[:email]
    @text = message[:text]
    mail(to: 'sgolikov82@gmail.com', subject: 'Сообщение от посетителя сайта www.techracing.ru')
  end

  def callback_email
  end

end
