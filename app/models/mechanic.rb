class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_years
    average(:years_experience)
  end

  def most_to_least_thrill
    rides.order(thrill_rating: :desc)
  end
end
