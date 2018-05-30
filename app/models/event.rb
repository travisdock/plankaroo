class Event < ApplicationRecord
  has_many :planks
  has_many :users, through: :planks

  def display_date
    self.date.strftime("%A, %B %-d")
  end

  def display_time
    self.time.strftime("%I:%M %p")
  end

  def self.all_except(args)
    where.not(id: args)
  end



end
