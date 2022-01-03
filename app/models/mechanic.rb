class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.avg_years_exp
    Mechanic.average(:years_experience)
  end

  def open_rides
    rides.where(open: true).order(thrill_rating: :desc)
  end

  def add_ride(id)
    mechanic_id = self.id
    RideMechanic.create!(ride_id: id, mechanic_id: mechanic_id)
  end
end
