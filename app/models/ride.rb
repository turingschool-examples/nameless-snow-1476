class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.open?
    where(open: true)
  end

  def self.desc_thrill
    order(thrill_rating: :desc)
  end
end
