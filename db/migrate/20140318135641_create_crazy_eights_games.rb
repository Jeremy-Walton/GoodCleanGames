class CreateCrazyEightsGames < ActiveRecord::Migration
  def change
    create_table :crazy_eights_games do |t|

      t.timestamps
    end
  end
end
