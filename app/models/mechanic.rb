class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years_experience
    average(:years_experience)
  end

  def open_rides_ordered
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
