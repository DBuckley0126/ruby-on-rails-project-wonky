class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationMethods

  helper_method :current_user, :logged_in?, :user_or_farmer

  def signup
    if session[:user_id] || session[:farmer_id]
      redirect_to root_path, alert: "You need to logout before accessing this page"
    else 
      @user = User.new
      @farmer = Farmer.new
    end
  end

  def login
    if session[:user_id] || session[:farmer_id]
      redirect_to root_path, alert: "You need to logout before accessing this page"
    else 
      @user = User.new
      @farmer = Farmer.new
    end
  end


end
