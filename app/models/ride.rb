class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.by_thrill_desc
    all.order(thrill_rating: :desc)
  end

  def self.by_name_abc
    order(:name)
  end

  def self.average_thrill
    average(:thrill_rating)
  end 
end
