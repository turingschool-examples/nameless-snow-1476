class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.thrill_order
    Ride.order(thrill_rating: :desc)
  end
end
