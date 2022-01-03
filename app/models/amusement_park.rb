class AmusementPark < ApplicationRecord
  has_many :rides, dependent: :destroy

  validates_presence_of :name, :admission_cost
end
