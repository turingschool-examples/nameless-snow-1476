class Ride < ApplicationRecord
  belongs_to :amusement_park

  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.opened
    where('open = true')
  end

  def self.thrill_order
    order(thrill_rating: :desc)
  end
end
