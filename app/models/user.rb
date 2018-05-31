class User < ApplicationRecord
  has_many :planks
  has_many :events, through: :planks
  belongs_to :cohort
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

  def total_plank
    self.planks.map do |plank|
      plank.total_seconds
    end.sum
  end

  def longest_plank
    #make method that finds longest plank time
  end

  def self.class_total
    self.all.map do |x|
      # use longest plank and print each one to the screen
      
    end
  end
#   def pr
#     self.planks.map do |plank|
#       plank.total_seconds
#     end.max
#   end
#
#   def self.pr_sort
#     User.all.sort_by()
#   end
# end
end
