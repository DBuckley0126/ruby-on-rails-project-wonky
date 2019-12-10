class Listing < ApplicationRecord
  belongs_to :farmer
  belongs_to :category
  has_many :purchases
  has_many :users, through: :purchases
  
  validates :title, presence: { message: 'is required' }
  validates :price, presence: { message: 'is required' }
  validates :price, numericality: true
  validates :category_id, presence: { message: 'is required' }
  validates :farmer_id, presence: true
  validates :measurement, presence: { message: 'is required' }
  validates :measurement, inclusion: { in: %w(g kg), message: "is not a valid measurement. Must be 'g' or 'kg'" }
end