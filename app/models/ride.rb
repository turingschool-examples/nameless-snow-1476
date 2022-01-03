class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.thrill_order 
    Ride.order(thrill_rating: :desc)
  end

  def self.alphabetical_order
    Ride.order(:name)
  end

  def self.average_thrill_rating 
    Ride.average(:thrill_rating).round
  end
end
