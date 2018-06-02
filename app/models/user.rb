class User < ApplicationRecord
  has_many :planks
  has_many :events, through: :planks
  belongs_to :cohort
  validates :name, :presence => true
  validates :name, :uniqueness => true
  has_secure_password

  def best_time
    Time.at(self.best).strftime("%M:%S")
  end

  def total_time
    seconds = self.total % 60
    minutes = (self.total / 60) % 60
    hours = self.total / (60 * 60)
    format("%02d:%02d:%02d", hours, minutes, seconds)
    # if self.total < 3600
    #   Time.at(self.total).strftime("%M:%S")
    # else
    #
    # end
  end

  def percent_of_cohort
    if self.total > 0
      (self.total.to_f / self.cohort.total) * 100
    else
      0
    end
  end

  #no longer in use
  def best_plank_rank
    if self.total > 0
      User.order('best DESC').index(self) + 1
    else
      "No Planks"
    end
  end

  def better_best_plank_rank
    if self.total > 0
      times_list = User.all.map {|user| user.best }.uniq!
      if times_list.length > 1
        times_list = times_list.sort {|x,y| -(x <=> y)}
      end
      user_rank = times_list.index(self.best) + 1
      user_rank
    else
      "No Planks"
    end
  end

  def total_plank_rank
    if self.total > 0
      User.order('total DESC').index(self) + 1
    else
      "No Planks"
    end
  end

  def completed_planks
    self.planks.select { |plank| (plank.minutes + plank.seconds) > 0}
  end

  def uncompleted_planks
    self.planks.select { |plank| (plank.minutes + plank.seconds) == 0}
  end

  def uncompleted_plank_events
    self.uncompleted_planks.map {|plank| plank.event }
  end

  def sorted_planks
    self.completed_planks.sort_by do |plank|
      plank.event.date
    end.last(5).reverse
  end

end
