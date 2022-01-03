class Mechanic < ApplicationRecord
  has_many :rides
  belongs_to :amusement_park


  # I think this should be in the model, but I don't know exactly how to do it
  # def average_xp
  #   self.average(:yearsxp)
  # end
end
