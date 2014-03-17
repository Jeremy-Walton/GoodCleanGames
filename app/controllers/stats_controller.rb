class StatsController < ApplicationController
  before_action :signed_in_user, only: :index
  def index
    @stats = current_user.stats
  end

  def show
    statistic = Stat.find_by(game_type: params[:game_type], user_id: current_user.id)
    statistic = Stat.new(game_type: params[:game_type], user_id: current_user.id, times_played: 0, wins: 0, losses: 0) unless statistic
    statistic.wins += 1 if params[:increment] == "wins"
    statistic.losses += 1 if params[:increment] == "losses"
    statistic.save
    render json: statistic
  end

  private
    def signed_in_user
      unless signed_in?
        redirect_to root_url, notice: "You need to be signed in to have stats."
      end
    end

end
