class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_age
    average(:years_experience).round(1)
  end

  def working_on_open_rides
    rides.where(open: true)
         .order(thrill_rating: :desc)
  end

end
