class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  def signup
    @user = User.new
    @farmer = Farmer.new
  end

  def login
    @farmer = Farmer.new
    @user = User.new
  end

  def current_user
    if session.has_key(:user_id)
      return @current_user = User.find_by_id(session[:user_id])
    elsif session.has_key(:farmer_id)
      return @current_user = Farmer.find_by_id(session[:farmer_id])
    else
      return @current_user = nil
    end
  end

   def logged_in?
     current_user != nil
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

  def login_param_validation(params)
    model = params.keys[1]
    model_key = model.to_sym
    model_class = model.classify.constantize
    obj = model_class.new

    obj.errors.add("email", "is required") if params[model_key][:email] == ""
    obj.errors.add("password", "is required") if params[model_key][:password] == ""
    obj.errors.add("email", "is invalid") if !params[model_key][:email].match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)

    return obj
  end

end
