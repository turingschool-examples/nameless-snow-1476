class Mechanic < ApplicationRecord
  has_many :rides, through: :mechanic_rides
  has_many :mechanic_rides, dependent: :destroy

  validates_presence_of :name, :years_experience

  def self.yoe_average
    average(:years_experience)
  end
end
