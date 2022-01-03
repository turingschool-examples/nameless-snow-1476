class AddMechanicColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :mechanics, :thrill_rating
    remove_column :mechanics, :open

    add_column :mechanics, :years_experience, :integer
  end
end
