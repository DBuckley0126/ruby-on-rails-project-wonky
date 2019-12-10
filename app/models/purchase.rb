class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_one :farmer, through: :listing

  validates :listing_id, presence: { message: 'is required' }
  validates :user_id, presence: { message: 'is required' }

  validates :price, presence: { message: 'is required' }
  validates :price, numericality: true

  validates :amount, presence: { message: 'is required' }
  validates :amount, numericality: true

  validates :measurement, presence: { message: 'is required' }
  validates :measurement, inclusion: { in: %w(g kg), message: "is not a valid measurement. Must be 'g' or 'kg'" }

  def total_cost
    return (self.price * self.amount)
  end

end
