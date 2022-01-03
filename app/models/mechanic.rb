class Mechanic < ApplicationRecord
    has_many :ride_mechanics
    has_many :rides, through: :ride_mechanics

  def self.average_ages
    average(:years_experience)
  end
end
