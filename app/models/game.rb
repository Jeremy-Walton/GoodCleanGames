class Game < ActiveRecord::Base
  has_many :game_users
  has_many :users, through: :game_users

  def has_enough_users?
    users.count == number_of_players
  end
end
