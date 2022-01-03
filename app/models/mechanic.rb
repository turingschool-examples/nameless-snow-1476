class Mechanic < ApplicationRecord
  has_many :rides

  # I think this should be in the model, but I don't know exactly how to do it 
  # def average_xp
  #   binding.pry
  #   self.average(:yearsxp)
  # end
end
