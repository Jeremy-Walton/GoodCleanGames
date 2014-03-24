class CrazyEightsTurnController < ApplicationController

  def create
    @game = CrazyEightsGame.find_by(id: params[:id])
    @game.data = params[:data]
    # @game.round_result = params[:round_result]
    if @game.save
      render nothing: true
    else
      render nothing: true, status: :not_found
    end
  end

end
