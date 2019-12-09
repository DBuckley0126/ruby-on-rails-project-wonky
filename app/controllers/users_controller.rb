class UsersController < ApplicationController

  def show

  end

  def create
    @user = User.new(user_strong_params)
    if !@user.valid?
      @farmer = Farmer.new
      render 'application/signup'
    else
      @user.save
      session[user_id: @user.id]
      redirect_to root_path, notice: 'Account Created'
    end
  end

  private

  def user_strong_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_of_service )
  end


end
