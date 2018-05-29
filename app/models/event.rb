class Event < ApplicationRecord
  has_many :planks
  has_many :users, through: :planks
end
