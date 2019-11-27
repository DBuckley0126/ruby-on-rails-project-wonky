class Category < ApplicationRecord
  has_many :listings
  has_many :farmers, through: :listings

end
