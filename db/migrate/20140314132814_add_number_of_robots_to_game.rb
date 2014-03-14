class AddNumberOfRobotsToGame < ActiveRecord::Migration
  def change
    add_column :games, :number_of_robots, :integer
  end
end
