class AmusementPark < ApplicationRecord
  has_many :rides

  def sorted_rides
    self.rides.order(:name)
  end

  def average_thrill
    rides = self.rides
    rides.sum(:thrill_rating).to_f / rides.count
  end 
end
