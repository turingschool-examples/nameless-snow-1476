class AmusementPark < ApplicationRecord
  has_many :rides

  def ordered_rides
    self.rides.order(:name)
  end

  def average_thrill_rating
    self.rides.average(:thrill_rating).to_i
  end
end
