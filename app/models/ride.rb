class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.filtered
    where(open: true).order(thrill_rating: :desc)
  end

  def self.average_thrill
    average(:thrill_rating)
  end

  def self.alpha_sort
    order(:name)
  end 
end
