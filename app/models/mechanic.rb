class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates_presence_of :name, :years_experience

  # Class Methods
  def self.avg_years
    average(:years_experience).round(2)
  end

  # Instance Methods
  def open_rides
    rides.where(open: true)
  end

  def open_and_thrill_order
    open_rides.order(thrill_rating: :desc)
  end
end
