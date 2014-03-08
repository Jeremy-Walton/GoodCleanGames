class StatsController < ApplicationController
  before_action :signed_in_user, only: :index
  def index
    # @stats = Stat.where(user_id: current_user.id)
    @stats = current_user.stats
  end

  def show
    statistic = Stat.find_by(game_type: params[:game_type], user_id: current_user.id)
    if statistic
      if params[:increment] == "times_played"
        statistic.times_played += 1
      elsif params[:increment] == "wins"
        statistic.wins += 1
      elsif params[:increment] == "losses"
        statistic.losses += 1
      else

      end
      statistic.save
      render json: statistic
      # render nothing: true
    else
      statistic = Stat.new(game_type: params[:game_type], user_id: current_user.id, times_played: 1, wins: 0, losses: 0)
      if statistic.save
        render json: statistic
        # render nothing: true
      else
        render nothing: true, status: :not_found
      end
    end
  end

  private
    def signed_in_user
      unless signed_in?
        redirect_to root_url, notice: "You need to be signed in to have stats."
      end
    end

end
