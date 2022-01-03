class AmusementPark < ApplicationRecord
  has_many :rides

  def alpha_ordered_rides
    self.rides.order(name: :asc)
  end

  def average_thrill_rating
    self.rides.average(:thrill_rating)
  end
end
