class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_type
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
