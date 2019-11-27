class Farmer < ApplicationRecord
  has_many :listings
  has_many :purchases, through: :listings
  has_many :users, through: :listings
  has_many :categories, through: :listings
  
  has_secure_password

end
