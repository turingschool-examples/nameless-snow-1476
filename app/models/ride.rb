class Ride < ApplicationRecord
  belongs_to :amusement_park

  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.most_to_least_thrilling
    order(thrill_rating: :desc)
  end

  def self.alphabetical_order
    order(:name)
  end
end
