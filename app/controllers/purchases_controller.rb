class PurchasesController < ApplicationController
  before_action :user_redirect_check, only: [:new, :create, :destroy]

  def new
    @user = current_user
    @purchase = Purchase.new(purchase_attributes(params[:purchase][:listing_id], params[:purchase][:amount]))
    redirect_to listing_path(params[:purchase][:listing_id]) if @purchase.invalid?
    render 'purchases/new'
  end

  def create
    @purchase = Purchase.new(purchase_strong_params)
    if @purchase.valid? && @purchase.user_id == current_user.id
      @purchase.save
      redirect_to root_path, notice: "Wonky Produce purchased!"
    else
      redirect_to listing_path(params[:purchase][:listing_id])
    end
  end

  def destroy
    user = current_user
    if params[:user_id].to_i == user.id
      Purchase.find_by_id(params[:id]).destroy
      redirect_to user_path(user)
    else
      redirect_to root_path, notice: "You do not own this purchase"
    end
  end

  def purchase_attributes(listing_id, amount)
    listing = Listing.find_by_id(listing_id)
    listing ? {listing_id: listing_id, user_id: current_user.id, amount: amount, price: listing.price, measurement: listing.measurement} : "ERROR"
  end

  def purchase_strong_params
    params.require(:purchase).permit(:user_id, :listing_id, :amount, :price, :measurement )
  end

end
