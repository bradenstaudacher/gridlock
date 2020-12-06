class CreateRaceResults < ActiveRecord::Migration[6.0]
  def change
    create_table :race_results do |t|
      t.integer :driver_id
      t.integer :race_id
      t.integer :position
      t.integer :points

      t.timestamps
    end
  end
end
