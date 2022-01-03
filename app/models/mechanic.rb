class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates_presence_of :name, :years_experience

  # Class Methods
  def self.avg_years
    average(:years_experience).round(2)
  end
end
