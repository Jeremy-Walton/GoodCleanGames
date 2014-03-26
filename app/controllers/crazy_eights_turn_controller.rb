class CrazyEightsTurnController < ApplicationController
  before_filter :authenticate_for_api
  skip_before_filter :verify_authenticity_token

  def create
    @game = CrazyEightsGame.find(params[:crazy_eight_id])
    @game.data = params[:game]
    if @game.save
      render json: {game: {id: @game.id}}
    else
      render nothing: true, status: :not_found
    end
  end

end
