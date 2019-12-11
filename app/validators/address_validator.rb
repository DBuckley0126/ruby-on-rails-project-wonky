class AddressValidator < ActiveModel::Validator
  #Validates if address inputted could be found by checking if latitude and longitude have been updated (Would be blank if address could not be found)
  def validate(record)
    if record.latitude.blank? || record.longitude.blank?
      record.errors[:address] << ("is invalid. Should be in format Street, City, County, Postcode, Country")
    end
  end
end