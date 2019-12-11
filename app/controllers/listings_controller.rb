#only index, show
class ListingsController < ApplicationController
  before_action :farmer_redirect_check, only: [:new, :create, :edit, :update, :destroy]

  def index
    #checks if params include filter data
    if params.has_key?(:distance) || params.has_key?(:category_id)
      @listings = Listing.all
      params[:distance] == "" ? false : @listings = @listings.select{|listing| listing.farmer.distance_to([current_user.latitude, current_user.longitude]) < params[:distance].to_i }
      params[:category_id] == "" ? false : @listings = @listings.select{|listing| listing.category_id == params[:category_id].to_i}
      render 'listings/index'
    else
      @listings = Listing.all
      render 'listings/index'
    end
  end

  def show
    @listing = Listing.find_by_id(params[:id])
    redirect_to root_path, alert: "Cant Find Listing" if !@listing
  end

  def new
    @listing = current_user.listings.build
    @categories = Category.all
  end

  def create
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
    @listing = Listing.find_by(id: params[:id], farmer_id: params[:farmer_id])
    redirect_to farmer_path(current_user) if !@listing
    @categories = Category.all
  end

  def update
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
