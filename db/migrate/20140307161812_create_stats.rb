class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :game_type
      t.integer :user_id
      t.integer :times_played
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
