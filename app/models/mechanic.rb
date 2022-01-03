class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :years_experience


  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_experience
    average(:years_experience)
  end

  def ordered_rides
    rides.where(open: :true).order(thrill_rating: :desc).pluck(:name)
  end

end
