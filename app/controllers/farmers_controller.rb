class FarmersController < ApplicationController

  def show
    farmer_redirect_check
    @farmer = current_user
  end

  def create
    @farmer = Farmer.new(farmer_strong_params)
    if !@farmer.valid?
      @user = User.new
      render 'application/signup'
    else
      @farmer.save
      session[:farmer_id] = @farmer.id
      redirect_to root_path, notice: 'Account Created'
    end
  end

  def edit
    farmer_redirect_check
    @farmer = current_user
  end

  def update
    farmer_redirect_check
    @farmer = current_user
    @farmer.assign_attributes(farmer_strong_params)
    if @farmer.valid?
      @farmer.save
      redirect_to farmer_path(@farmer)
    else
      render 'farmers/edit'
    end
  end


  def farmer_strong_params
    params.require(:farmer).permit(:name, :email, :password, :password_confirmation, :terms_of_service, :farm_name, :address, :description, :organic_certification)
  end

end
