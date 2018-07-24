class Plank < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :minutes, :presence => true
  validates :seconds, :presence => true

  def plank_time
    sec = self.seconds < 10 ? "0#{self.seconds}" : "#{self.seconds}"
    "#{self.minutes}:"+sec
  end

  def total_seconds
    self.seconds + (self.minutes * 60)
  end

  def completed
    (self.minutes + self.seconds) > 0 ? true : false
  end

end
