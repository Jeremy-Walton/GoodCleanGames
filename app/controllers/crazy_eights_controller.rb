class CrazyEightsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :new, :create]

  def show
    @game = CrazyEightsGame.find(params[:id])
    render json: { game: @game, users: @game.users }
  end

  def index
    @games = CrazyEightsGame.all
  end
end
