class Ride < ApplicationRecord
  belongs_to :amusement_park
  belongs_to :mechanic
  accepts_nested_attributes_for :amusement_park, :mechanic

  def rides
    Ride.where("mechanic_id = ? OR amusement_park_id = ?", self.id, self.id)
  end
end
