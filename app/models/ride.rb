class Ride < ApplicationRecord
  has_many :mechanic_rides, dependent: :destroy
  has_many :mechanics, through: :mechanic_rides
  belongs_to :amusement_park

  validates_presence_of :name, presence: true
  validates_presence_of :thrill_rating, presence: true

  def self.open
    where(open: true)
  end

  def self.sort_thrill_rating
    Ride.all.order(thrill_rating: :desc)
  end
end
