class Mechanic < ApplicationRecord

  def self.avg_years_experience
    average(:years_experience)
  end
end
