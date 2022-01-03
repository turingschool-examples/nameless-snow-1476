class Mechanic < ApplicationRecord
  has_many :mechanics_rides
  has_many :rides, through: :mechanics_rides

  def self.average_years
    mechs = Mechanic.all
    mechs.sum(:years_experience).to_f / mechs.count
  end

  def current_rides
    rides = Ride.joins(:mechanics_rides => {:mechanic => :rides}).where(:rides => {:open => true})
    rides.order(thrill_rating: :desc).uniq
  end
end
