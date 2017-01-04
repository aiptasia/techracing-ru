class UserActivitiesController < ApplicationController

  def codeword_request
    @user_activity = UserActivity.new(codeword_request_params)
    if @user_activity.save
      redirect_to :back, notice: {title: 'Поздравляем!', text: "Ваш промо-код: 3104"}
    else
      redirect_to :back, notice: {title: 'Ошибка', text: 'Попробуйте повторить позже.'}
    end
  end

  def price_request
    @user_activity = UserActivity.new(price_request_params)
    if @user_activity.save
      redirect_to :back, notice: {title: 'Спасибо!', text: 'Мы сообщим Вам стоимость запчастей в ближайшее время.'}
    else
      redirect_to :back, notice: {title: 'Ошибка', text: 'Попробуйте повторить позже.'}
    end
  end

  def new_callback
    @user_activity = UserActivity.new(callback_request_params)
    if @user_activity.save
      redirect_to :back, notice: {title: 'Спасибо!', text: 'Мы свяжемся с Вами в ближайшее время.'}
    else
      redirect_to :back, notice: {title: 'Ошибка!', text: 'Попробуйте повторить позже.'}
    end
  end

  def new_feedback
    @user_activity = UserActivity.new(feedback_params)
    if @user_activity.save
      redirect_to contacts_path, notice: {title: 'Спасибо!', text: 'Мы ответим Вам в ближайшее время.'}
    else
      redirect_to contacts_path, notice: {title: 'Ошибка!', text: 'Попробуйте повторить позже.'}
    end
  end

  private

  def user_activity_params
    params.permit(:session_id, :source, :action, :user_info)
  end

  def codeword_request_params
    params[:user_info] = ''
    user_activity_params
  end

  def price_request_params
    params[:user_info] = JSON.generate(params.permit(:name, :phone, :vin))
    user_activity_params
  end

  def callback_request_params
    params[:user_info] = JSON.generate(params.permit(:name, :phone))
    user_activity_params
  end

  def feedback_params
    params[:user_info] = JSON.generate(params.permit(:name, :email, :message))
    user_activity_params
  end

end
