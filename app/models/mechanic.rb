class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides
  
  validates_presence_of :names, :years

  def self.avg_years
    average(:years)
  end
end
