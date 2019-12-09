class ApplicationController < ActionController::Base
  protect_from_forgery


  def signup
    @user = User.new
    @farmer = Farmer.new
  end

  def login

  end


  def farmer_redirect_check
    if farmer_signed_in?
      return true
    else
      redirect_to login_path
    end
  end

  def user_redirect_check
    if user_signed_in?
      return true
    else
      redirect_to login_path
    end
  end

  
end
