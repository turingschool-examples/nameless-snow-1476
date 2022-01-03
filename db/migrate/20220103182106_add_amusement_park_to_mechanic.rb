class AddAmusementParkToMechanic < ActiveRecord::Migration[5.2]
  def change
    add_reference :mechanics, :amusement_park, foreign_key: true
  end
end
