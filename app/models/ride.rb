class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.thrill_order 
    Ride.order(thrill_rating: :desc)
  end
end
