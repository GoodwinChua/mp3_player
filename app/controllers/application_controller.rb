class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login
  
  def current_user
      User.where(id: session[:user_id]).first
  end
    
  private

  def require_login
      if session[:user_id].nil?
          redirect_to action: :home 
      end
  end
    
end
