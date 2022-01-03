class Mechanic < ApplicationRecord

  def self.avg_years_experience
    average(:years_experience).round(2)
  end
end
