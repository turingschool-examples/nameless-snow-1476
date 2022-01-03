class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_by_name
    rides.order(:name)
  end
  
end
