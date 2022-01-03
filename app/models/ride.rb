class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.search_rides_by_name(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end
end
