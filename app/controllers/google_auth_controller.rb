class GoogleAuthController < ApplicationController
require 'securerandom'

  def new
    @user = User.find_by(uid: request.env['omniauth.auth'][:uid])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You logged in with Google'
    else 
      @user = User.new(uid: request.env['omniauth.auth'][:uid]) do |u|
        u.name = request.env['omniauth.auth'][:info][:first_name] + request.env['omniauth.auth'][:info][:last_name]
        u.email = request.env['omniauth.auth'][:info][:email]
        u.image = request.env['omniauth.auth'][:info][:image]
      end
    end
  end

  def create
    random_password = SecureRandom.base64(15)

    @user = User.new(google_auth_user_strong_params)
    @user.password = random_password
    @user.password_confirmation = random_password

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account created with Google'
    else
      render 'google_auth/new'
    end
  end

  def google_auth_user_strong_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :terms_of_service, :uid, :image)
  end

end
