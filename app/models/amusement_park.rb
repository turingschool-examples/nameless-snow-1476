class AmusementPark < ApplicationRecord
  has_many :rides

  def alpha_rides
    rides.order(name: :asc)
  end

  def avg_ride_thrill
    rides.average(:thrill_rating).to_i
  end
end
