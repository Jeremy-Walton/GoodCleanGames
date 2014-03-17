class AddRoundResultToGame < ActiveRecord::Migration
  def change
    add_column :games, :round_result, :string
  end
end
