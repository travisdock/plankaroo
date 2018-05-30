class User < ApplicationRecord
  has_many :planks
  has_many :events, through: :planks
  belongs_to :cohort
  #has_secure_password
end
