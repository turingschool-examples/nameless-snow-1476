class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha
    rides.order(:name)
  end

  def average_thrills
    rides.average(:thrill_rating).round(2)
  end
end
