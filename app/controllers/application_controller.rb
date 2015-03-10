class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def require_login
  	unless current_user
  		redirect_to login_path, notice: "You need to login!"
  	end
  end

end
