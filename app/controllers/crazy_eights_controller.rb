class CrazyEightsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @game = CrazyEightsGame.new(name: "test", data: params[:game])
    @game.save
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
