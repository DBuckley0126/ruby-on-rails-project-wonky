class User < ApplicationRecord
  has_secure_password

  has_many :purchases
  has_many :farmers, through: :purchases

  validates :name, presence: { message: 'is required' }
  validates :name, length: {maximum: 25, message: 'must not be longer than 25 characters'}

  validates :email, presence: { message: 'is required' }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: { message: 'is already been used'}
  

  validates :password, presence: { message: 'is required' }
  validates :password_confirmation, presence: { message: 'is required' }
  validates_confirmation_of :password, message: 'should match password'
  validates_strength_of :password, :with => :email, :level => :good

  validates_acceptance_of :terms_of_service, on: :create

end
