class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.average_years
    mechs = Mechanic.all
    mechs.sum(:years_experience).to_f / mechs.count
  end
end
