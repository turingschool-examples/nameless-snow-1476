class Mechanic < ApplicationRecord
  validates_presence_of :names, :years

  def self.avg_years
    average(:years)
  end
end
