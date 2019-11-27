class Listing < ApplicationRecord
  helongs_to :farmer
  belongs_to :category
  has_many :purchases
  has_many :users, through: :purchases
  

end
