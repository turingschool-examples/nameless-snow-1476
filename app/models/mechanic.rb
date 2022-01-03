class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_exp
    average(:years_of_experience).round(2)
  end

  def only_open
    rides.where('open = true')
  end
end
