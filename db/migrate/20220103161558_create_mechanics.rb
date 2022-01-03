class CreateMechanics < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.float :years_of_experience

      t.timestamps
    end
  end
end
