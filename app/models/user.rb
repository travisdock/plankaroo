class User < ApplicationRecord
  has_many :planks
  has_many :events, through: :planks
  belongs_to :cohort
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :password, :presence => true
  has_secure_password

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
