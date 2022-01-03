class Mechanic < ApplicationRecord
  validates_presence_of :names, :years
end
