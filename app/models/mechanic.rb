class Mechanic < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :years_experience


  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def self.avg_years_experience
    average(:years_experience)
  end

end
