class Farmer < ApplicationRecord
  include ActiveModel::Validations

  has_secure_password

  has_many :listings
  has_many :purchases, through: :listings
  has_many :users, through: :listings
  has_many :categories, through: :listings

  geocoded_by :address do |object, results|
    if results.present?
     object.latitude = results.first.latitude
     object.longitude = results.first.longitude
    else
     object.latitude = nil
     object.longitude = nil
    end
  end

  before_validation :geocode, if: :address_changed?

  validates :address, presence: { message: 'is required'}
  validates_with AddressValidator

  validates :name, presence: { message: 'is required' }
  validates :name, length: {maximum: 25, message: 'must not be longer than 25 characters'}

  validates :email, presence: { message: 'is required' }, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :email, uniqueness: { message: 'is already been used'}, on: :create
  

  validates :password, presence: { message: 'is required' }, on: :create
  validates :password_confirmation, presence: { message: 'is required' }, on: :create
  validates_confirmation_of :password, message: 'should match password', on: :create
  validates_strength_of :password, :with => :email, :level => :good, on: :create

  validates :farm_name, presence: { message: 'is required' }
  validates :description, presence: { message: 'is required' }

  validates_acceptance_of :terms_of_service, on: :create

end
