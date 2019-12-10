class UsersController < ApplicationController

  def show
    user_redirect_check
    @user = current_user
  end

  def create
    @user = User.new(user_strong_params)
    if !@user.valid?
      @farmer = Farmer.new
      render 'application/signup'
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Account Created'
    end
  end

  def edit
    user_redirect_check
    @user = current_user
  end

  def update
    user_redirect_check
    @user = current_user
    @user.assign_attributes(user_strong_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render 'users/edit'
    end
  end



  private

  def user_strong_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :terms_of_service )
  end


end
