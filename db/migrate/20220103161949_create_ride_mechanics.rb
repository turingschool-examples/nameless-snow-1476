class CreateRideMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :ride_mechanics do |t|
      t.integer :ride_id
      t.integer :mechanic_id

      t.timestamps
    end
  end
end
