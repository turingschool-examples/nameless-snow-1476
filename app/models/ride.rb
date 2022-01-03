class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides
    Ride.where(open: true)
  end

  def self.thrill_rating
    Ride.order(thrill_rating: :desc)
  end
end
