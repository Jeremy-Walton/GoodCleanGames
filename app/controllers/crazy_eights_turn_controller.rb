class CrazyEightsTurnController < ApplicationController

  def create
    @game = CrazyEightsGame.find_by(id: params[:id])
    @game.data = params[:game]
    if @game.save
      render json: {game: {id: @game.id}}
    else
      render nothing: true, status: :not_found
    end
  end

end
