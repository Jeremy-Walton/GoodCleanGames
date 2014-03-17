class CreateIDoubtItGames < ActiveRecord::Migration
  def change
    create_table :i_doubt_it_games do |t|
      t.string :name
      t.text :data
      t.integer :number_of_players
      t.integer :number_of_robots
      t.string :round_result

      t.timestamps
    end
  end
end
