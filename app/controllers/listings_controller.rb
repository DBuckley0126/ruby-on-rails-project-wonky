#only index, show
class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find_by_id(params[:id])
    redirect_to root_path, alert: "Cant Find Listing" if !@listing
  end

  def new
    farmer_redirect_check
    @listing = current_user.listings.build
    @categories = Category.all
  end

  def create
    farmer_redirect_check
    @listing = Listing.new(listing_strong_params)
    @listing.farmer = current_user
    if @listing.valid?
      @listing.save
      redirect_to farmer_path(@listing.farmer)
    else
      @categories = Category.all
      render 'listings/new'
    end
  end

  def edit
    farmer_redirect_check
    @listing = Listing.find_by(id: params[:id], farmer_id: params[:farmer_id])
    redirect_to farmer_path(current_user) if !@listing
    @categories = Category.all
  end

  def update
    farmer_redirect_check
    @listing = Listing.find_by(id: params[:id], farmer_id: params[:farmer_id])
    @listing.assign_attributes(listing_strong_params)
    if @listing.valid?
      @listing.save
      redirect_to listing_path(@listing)
    else
      @categories = Category.all
      render 'listings/edit'
    end
  end

  def destroy
    farmer_redirect_check
    farmer = current_user
    if params[:farmer_id].to_i == farmer.id
      Listing.find_by_id(params[:id]).destroy
      redirect_to farmer_path(farmer)
    else
      redirect_to root_path, notice: "You do not own this listing"
    end
  end

  def listing_strong_params
    params.require(:listing).permit(:title, :farmer_id, :category_id, :measurement, :price, :organic)
  end

end
