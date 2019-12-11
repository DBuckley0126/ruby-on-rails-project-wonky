module ApplicationMethods
  extend ActiveSupport::Concern

  # Returns current user or farmer from session
  def current_user
    if session
      if session.has_key?(:user_id)
        return @current_user = User.find_by_id(session[:user_id])
      elsif session.has_key?(:farmer_id)
        return @current_user = Farmer.find_by_id(session[:farmer_id])
      else
        nil
      end
    end
  end

  # Checks user logged in
  def logged_in?
    current_user != nil
  end

  # Checks if farmer is logged in from session or redirect to login
  def farmer_redirect_check
    if session[:farmer_id] && current_user
      return true
    else
      redirect_to login_path
    end
  end

  # Checks if user is logged in from session or redirect to login
  def user_redirect_check
    if session[:user_id] && current_user
      return true
    else
      redirect_to login_path
    end
  end

  # Returns user type logged in from session
  def user_or_farmer
    if session[:farmer_id]
      "farmer"
    elsif session[:user_id]
      "user"
    else
      "error"
    end
  end

  # Provides input validation for login form, adding errors to inputs if invalid
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