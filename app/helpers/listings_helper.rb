module ListingsHelper

  # Returns marker url paramaters for google map api
  def map_marker_maker(user, listings)
    output_string = "&markers=size:mid%7Ccolor:0xff0000%7Clabel:%7C#{user.latitude},#{user.longitude}"
    listings.uniq{ |listing| listing.farmer }.each_with_index do |listing, index|
      output_string += "&markers=size:mid%7Ccolor:0xff0000%7Clabel:#{index + 1}%7C#{listing.farmer.latitude},#{listing.farmer.longitude}"
    end
    return output_string
  end

  # Returns current farmer count for listing index to correspond with google map markers
  def farmer_number(listing)
    if @current_farmer == listing.farmer
      return @farmer_count.to_s
    else
      @farmer_count += 1
      @current_farmer = listing.farmer
      return @farmer_count.to_s
    end
  end
end
