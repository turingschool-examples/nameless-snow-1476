class Ride < ApplicationRecord
    belongs_to :amusement_park
    has_many :ride_mechanics
    has_many :mechanics, through: :ride_mechanics

    def self.order_thrill_and_open
       where(open: :true)
      .order(thrill_rating: :desc)
      .pluck(:name)
    end
end
