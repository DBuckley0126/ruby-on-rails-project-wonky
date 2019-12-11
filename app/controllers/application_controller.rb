class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationMethods

  helper_method :current_user, :logged_in?, :user_or_farmer

  def signup
    require_logout
  end

  def login
    require_logout
  end

  def require_logout
    # Checks if user/farmer is logged out or redirect to root
    if session[:user_id] || session[:farmer_id]
      redirect_to root_path, alert: "You need to logout before accessing this page"
    else 
    # User/farmer is logged out 
      @user = User.new
      @farmer = Farmer.new
    end
  end

end
