class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  # def average_experience
  #   average(:years_experience)
  # end

  def open_rides_ordered
    # binding.pry
    rides.where(open:true).order('thrill_rating DESC')
  end
end
