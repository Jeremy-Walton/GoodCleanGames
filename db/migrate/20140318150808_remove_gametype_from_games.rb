class RemoveGametypeFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :game_type
  end
end
