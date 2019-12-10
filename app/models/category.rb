class Category < ApplicationRecord
  has_many :listings
  has_many :farmers, through: :listings

  validates :name, presence: { message: 'is required'}

end
