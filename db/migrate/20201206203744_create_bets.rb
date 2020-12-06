class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :driver_id
      t.integer :race_id

      t.timestamps
    end
  end
end
