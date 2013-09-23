class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  
  def current_user
    if session[:customer_id] == nil
      @current_user ||= Owner.find(session[:owner_id]) if session[:owner_id]
    else
      @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
  	end
  end

  helper_method :current_user

end
