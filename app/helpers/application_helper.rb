module ApplicationHelper

  def user_activity_source
    "#{params[:controller]}:#{params[:action]}"
  end

end
