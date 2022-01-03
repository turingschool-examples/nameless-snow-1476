class Mechanic < ApplicationRecord 
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_experience
    average(:years_experience)
  end

  def open_rides_maintained
    rides.where(open: true)
  end

  def open_rides_by_thrill
    open_rides_maintained.order(thrill_rating: :desc)
  end

  

end
