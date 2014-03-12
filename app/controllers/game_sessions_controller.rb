class GameSessionsController < ApplicationController

  def waiting
    @game_session = GameSession.find params[:id]
    if @game_session.player_count == @game_session.number_of_players
      return redirect_to # game page
    end
  end

  def show
    @game_session = GameSession.find params[:id]
    render json: @game_session
  end

  def new
    @game_session = GameSession.new(game_type: params[:game_type])
    @game_sessions = GameSession.all
  end

  def create
    @game_session = GameSession.new(game_session_params)
    if @game_session.save
      session[:game_session_id] = @game_session.id
      redirect_to @game_session
    else
      render :new
    end
  end

  def update
    # get the game session from DB
    # update with JSON you received
    # send push notification to connected clients
  end

  def join
    @game_session = GameSession.find params[:id]
    @game_session.add_player(current_user)
    redirect_to @game_session
  end

  private

  def game_session_params
    params.require(:game_session).permit(:game_type, :number_of_players)
  end
end