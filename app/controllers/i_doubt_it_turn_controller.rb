class IDoubtItTurnController < ApplicationController

  def create
    @game = IDoubtItGame.find_by(id: params[:id])
    @game.data = params[:data]
    @game.round_result = params[:round_result]
    if @game.save
      update_game(params[:id])
      render nothing: true
    else
      render nothing: true, status: :not_found
    end
  end

  def update_game(id)
    Pusher[id].trigger('reload_page', {
      message: ''
    })
  end

end
