class UsersController < ApplicationController
	before_filter :authenticate_user!
	def new

	end

  def lookup_stats
    statistic = Stat.find_by(game_type: params[:game_type], user_id: current_user.id)
    if statistic
      render json: statistic
    else
      statistic = Stat.new(game_type: params[:game_type], user_id: current_user.id, times_played: 0, wins: 0, losses: 0)
      if statistic.save
        render json: statistic
      else
        render nothing: true, status: :not_found
      end
    end
  end

  def update_stats
    statistic = Stat.find_by(game_type: params[:game_type], user_id: current_user.id)
    statistic.times_played = params[:times_played]
    statistic.wins = params[:wins]
    statistic.losses = params[:losses]
    if statistic.save
      render nothing: true
    else
      render nothing: true, status: :not_found
    end
  end
end
