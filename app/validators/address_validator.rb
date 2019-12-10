class AddressValidator < ActiveModel::Validator
  def validate(record)
    if record.latitude.blank? || record.longitude.blank?
      record.errors[:address] << ("is invalid. Should be in format Street, City, County, Postcode, Country")
    end
  end
end