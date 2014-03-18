class DeleteExtraTables < ActiveRecord::Migration
  def change

    drop_table :i_doubt_it_games
    drop_table :crazy_eights_games

  end
end
