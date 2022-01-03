class CreateMechanic < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.float :yearsxp
    end
  end
end
