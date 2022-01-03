class Ride < ApplicationRecord
  belongs_to :amusement_park

  has_many :mechanic_rides 
  has_many :mechanics, through: :mechanic_rides

  def self.only_open
    where('open = true')
  end

  def self.thrill_desc
    order(thrill_rating: :desc)  
  end
end
