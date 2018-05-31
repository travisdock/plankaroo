class Cohort < ApplicationRecord
  has_many :users

  def total_time
    Time.at(self.total).strftime("%M:%S")
  end
end
