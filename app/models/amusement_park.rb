class AmusementPark < ApplicationRecord
  has_many :rides

  def alphabetical
    rides.order(:name)
  end
end
