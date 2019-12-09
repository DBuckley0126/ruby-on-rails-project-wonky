class FarmersController < ApplicationController

  def show

  end

  def create
    @farmer = Farmer.new(farmer_strong_params)
    if !@farmer.valid?
      @user = User.new
      render 'application/signup'
    else
      @Farmer.save
      session[:farmer_id] = @farmer.id
      redirect_to root_path, notice: 'Account Created'
    end
  end

  def edit
    
  end

  def update

  end

  def farmer_strong_params
    params.require(:farmer).permit(:name, :email, :password, :password_confirmation, :terms_of_service, :farm_name, :address, :description, :organic_certification)
  end

end
