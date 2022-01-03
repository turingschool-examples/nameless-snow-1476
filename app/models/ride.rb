class Ride < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :thrill_rating


  belongs_to :amusement_park

  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides
    where(open: true)
  end

  def self.thrill_rating_descending
    Ride.order(thrill_rating: :desc)
  end
end
