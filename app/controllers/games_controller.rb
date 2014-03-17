class GamesController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  def home
  end
  def index
  end
  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game.data
    else
      render nothing: true, status: 400
    end
  end

  def lookup
    game = IDoubtItGame.find_by(id: params[:id])
    if game
      if (params[:just_game] == 'true')
        render json: game.data
      elsif (params[:just_result] == 'true')
        render text: game.round_result
      else
        render json: { game: game, users: game.users }
      end
    else
      render nothing: true, status: :not_found
    end
  end

  # Game methods

  def IDoubtIt

  end

  def IDoubtItStart

  end

  def IDoubtItRules

  end

  def CrazyEights

  end

  private
  def signed_in_user
    unless signed_in?
      redirect_to root_url, notice: "You need to sign in before you can play games."
    end
  end
  def game_params
    params.permit(:game_type, :name, :data, :round_result)
  end
end
