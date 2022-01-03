class Ride < ApplicationRecord
  belongs_to :amusement_park

  def rides
    Ride.where("mechanic_id = ? OR amusement_park_id = ?", self.id, self.id)
  end
end
