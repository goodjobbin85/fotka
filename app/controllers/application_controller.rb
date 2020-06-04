class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verified_user
  helper_method :current_user

  def home
    redirect_to signup_path
  end

  private

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end
  
     
end
