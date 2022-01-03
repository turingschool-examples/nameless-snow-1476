class Ride < ApplicationRecord
  belongs_to :amusement_park

  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.average_thrill_rating
    average(:thrill_rating).round(2)
  end

end
