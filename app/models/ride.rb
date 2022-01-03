class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.open_and_thrilling
    order(thrill_rating: :desc).where("open = ?", true)
  end
end
