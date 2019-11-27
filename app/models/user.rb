class User < ApplicationRecord
  has_many :purchases
  has_many :farmers, through: :purchases
  
  has_secure_password

end
