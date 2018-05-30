class Plank < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def plank_time
    "#{self.minutes}:#{self.seconds}"
  end

end
