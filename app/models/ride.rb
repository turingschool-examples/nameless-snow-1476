class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.filtered
    where(open: true).order(thrill_rating: :desc)
  end
end
