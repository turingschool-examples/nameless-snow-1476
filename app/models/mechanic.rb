class Mechanic < ApplicationRecord
  def self.average_years_experience
    average(:years_experience)
  end
end
