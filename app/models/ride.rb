class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.thrill_order 
    
  end
end
