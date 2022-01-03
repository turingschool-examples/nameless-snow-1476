class Mechanic < ApplicationRecord

  def average_years_experience
    Mechanic.average(years_experience)
  end
end