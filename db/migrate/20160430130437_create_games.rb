class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :num_players
      t.string :state
      t.integer :turn
      t.integer :turn_player

      t.timestamps null: false
    end
  end
end
