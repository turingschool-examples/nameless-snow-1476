class Mechanic < ApplicationRecord
  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  def self.average_years
    mechs = Mechanic.all
    mechs.sum(:years_experience).to_f / mechs.count
  end
end
