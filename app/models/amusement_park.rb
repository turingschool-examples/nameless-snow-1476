class AmusementPark < ApplicationRecord
  has_many :rides

  def order_rides
    rides.order(thrill_rating: :desc)
    .pluck(:name)
  end

  def average_thrill
    rides.average(:thrill_rating)
    .to_f.round(1)
  end

end
