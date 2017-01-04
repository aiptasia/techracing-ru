class StaticController < ApplicationController
  def index
  end

  def new_feedback
    @feedback = {
      name:     params[:name],
      email:    params[:email],
      text:     params[:text]}
    FeedbackMailer.feedback_email(@feedback).deliver_now

    #flash.now[:alert]  = 'xxx'
    redirect_to contacts_path#, notice: 'Спасибо! Ваше сообщение было отправлено.'
  end

end
