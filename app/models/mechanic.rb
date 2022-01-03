class Mechanic < ApplicationRecord

  def self.avg_years_experience
    average(:years_experience)
  end

  def open_rides
    rides.where(open: true)
  end
end
