class CrazyEightsController < ApplicationController
  # before_filter :authenticate_for_api
  # before_filter :authenticate_user!, only: [:index, :show, :new, :create]

  def create
    number_of_players = params[:number_of_players].to_i + 1
    number_of_robots = params[:number_of_robots].to_i
    @game = CrazyEightsGame.new(name: "New Game", data: params[:game], number_of_players: number_of_players, number_of_robots: number_of_robots)
    @game.save
    render nothing: true
  end

  def update
    @game = CrazyEightsGame.find(params[:game_id])
    @game.users << params[:current_user]
    # increment_times_played
    # redirect_to i_doubt_it_path(@game.id)
    render nothing: true
  end

  def show
    @game = CrazyEightsGame.find(params[:id])
    render json: { game: @game, users: @game.users }
  end

  def index
    @games = CrazyEightsGame.all
  end
end
