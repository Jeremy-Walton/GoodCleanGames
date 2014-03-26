class CrazyEightsController < ApplicationController
  before_filter :authenticate_for_api, except:[:index]
  skip_before_filter :verify_authenticity_token, except:[:index]

  def create
    number_of_players = params[:number_of_players].to_i + 1
    number_of_robots = params[:number_of_robots].to_i
    @game = CrazyEightsGame.new(name: current_user.email, data: params[:game], users: [current_user], number_of_players: number_of_players, number_of_robots: number_of_robots)
    @game.save
    render json: {game: {id: @game.id}}
  end

  def update
    @game = CrazyEightsGame.find(params[:id])
    @game.users << current_user
    # increment_times_played
    # redirect_to i_doubt_it_path(@game.id)
    render json: { game: { users: @game.users, start_game: @game.has_enough_users? } }
  end

  def show
    @game = CrazyEightsGame.find(params[:id])
    render json: { game: @game, users: @game.users }
  end

  def index
    @games = CrazyEightsGame.all
  end
end
