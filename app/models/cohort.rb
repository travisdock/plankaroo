class Cohort < ApplicationRecord
  has_many :users

  def total_time
    seconds = self.total % 60
    minutes = (self.total / 60) % 60
    hours = self.total / (60 * 60)
    format("%02d:%02d:%02d", hours, minutes, seconds)
  end

end
