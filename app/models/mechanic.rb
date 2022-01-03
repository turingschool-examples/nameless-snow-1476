class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  validates_presence_of :name, presence: true
  validates_presence_of :years_experience, presence: true

  def self.yoe_average
    average(:years_experience)
  end
end
