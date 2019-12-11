class SessionsController < ApplicationController

  def create
    #session create request coming from user
    if params.key?(:user)

      #returns user objected with any validation errors
      @user = login_param_validation(params)

      if !@user.errors.empty?
        @farmer = Farmer.new
        @user.email = params[:user][:email]
        
        render 'application/login'
      else
        #if form submitted with no validation errors, create session is attempted
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to root_path, notice: "You are logged in"
        else
          redirect_to login_path, alert: "Incorrect email or password"
        end
      end

    #session create request coming from farmer
    elsif params.key?(:farmer)
      
      #returns user objected with any validation errors
      @farmer = login_param_validation(params)

      if !@farmer.errors.empty?
        @user = User.new
        @farmer.email = params[:farmer][:email]
        
        render 'application/login'
      else
        #if form submitted with no validation errors, create session is attempted
        @farmer = Farmer.find_by(email: params[:farmer][:email])
        if @farmer && @farmer.authenticate(params[:farmer][:password])
          session[:farmer_id] = @farmer.id
          redirect_to root_path
        else
          redirect_to login_path, alert: "Incorrect email or password"
        end
      end
    end
  end

  def delete
    session.destroy if session
    redirect_to login_path, notice: "You have been logged out"
  end

end
