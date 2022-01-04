class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_order
    rides.order(name: :asc)
  end

  def thrill_fract
    rides.average(:thrill_rating).round(1)
  end
end
