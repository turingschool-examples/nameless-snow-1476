class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates :name, presence: true
  validates :years_experience, presence: true, numericality: true  

  def self.avg_years_experience
    average(:years_experience)
  end

  def open_rides
    rides.where(open: true)
  end

  def open_rides_by_thrill
    open_rides.by_thrill
  end
end
