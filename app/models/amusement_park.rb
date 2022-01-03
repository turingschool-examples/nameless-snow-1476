class AmusementPark < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :admission_cost

  has_many :rides
end
