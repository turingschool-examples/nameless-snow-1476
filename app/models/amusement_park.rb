class AmusementPark < ApplicationRecord
  has_many :rides

  validates_presence_of :name, :admission_cost

  # Instance methods
  def rides_alphabetical
    rides.order(:name)
  end

  def avg_thrill
    rides.average(:thrill_rating).round(1)
  end
end
