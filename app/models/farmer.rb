class Farmer < ApplicationRecord
  has_secure_password

  has_many :listings
  has_many :purchases, through: :listings
  has_many :users, through: :listings
  has_many :categories, through: :listings

  validates :name, presence: { message: 'is required' }
  validates :name, length: {maximum: 25, message: 'must not be longer than 25 characters'}

  validates :email, presence: { message: 'is required' }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { message: 'is already been used'}
  

  validates :password, presence: { message: 'is required' }
  validates :password_confirmation, presence: { message: 'is required' }
  validates_confirmation_of :password, message: 'should match password'
  validates_strength_of :password, :with => :email, :level => :good

  validates :farm_name, presence: { message: 'is required' }
  validates :location, presence: { message: 'is required' }
  validates :description, presence: { message: 'is required' }

  validates_acceptance_of :terms_of_service, on: :create

end
