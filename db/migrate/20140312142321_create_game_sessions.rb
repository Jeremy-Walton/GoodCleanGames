class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.string :game_type
      t.integer :number_of_players
      t.text :data

      t.timestamps
    end
  end
end
