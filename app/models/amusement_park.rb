class AmusementPark < ApplicationRecord
  has_many :rides

  def ordered_rides
    self.rides.order(:name)
  end
end
