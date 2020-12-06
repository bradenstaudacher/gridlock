class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.integer :age
      t.integer :team_id

      t.timestamps
    end
  end
end
