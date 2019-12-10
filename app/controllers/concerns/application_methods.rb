module ApplicationMethods
  extend ActiveSupport::Concern

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

  def logged_in?
    current_user != nil
  end


  def farmer_redirect_check
    if session[:farmer_id] && current_user
      return true
    else
      redirect_to login_path
    end
  end

  def user_redirect_check
    if session[:user_id] && current_user
      return true
    else
      redirect_to login_path
    end
  end

  def user_or_farmer
    if session[:farmer_id]
      "farmer"
    elsif session[:user_id]
      "user"
    else
      "error"
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