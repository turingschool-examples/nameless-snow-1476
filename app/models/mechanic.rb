class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_years_exp
    average(:years_experience)
  end

  def thrill_order
    rides.order(:thrill_rating).reverse
  end
end
