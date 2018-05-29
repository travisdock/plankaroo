class User < ApplicationRecord
  has_many :planks
  has_many :events, through: :planks
  has_secure_password
end
