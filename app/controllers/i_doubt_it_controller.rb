class IDoubtItController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :new, :create]

  def new

  end

  def show

  end

  def waiting
    # need to refresh this page
    @game = Game.find(params[:id])
    if @game.has_enough_users?
      return redirect_to i_doubt_it_path(@game.id)
    end
  end

  def create

    if (params[:gametype] == 'new')
      number_of_players = params[:number_of_players].to_i + 1
      @game = Game.new(game_type: "I Doubt It", name: current_user.email, data: '', users: [current_user], number_of_players: number_of_players)
      if @game.save
        redirect_to waiting_i_doubt_it_path(@game.id)
      end
    else
      @game = Game.find(params[:game_id])
      @game.users << current_user
      redirect_to waiting_i_doubt_it_path(@game.id)
    end

  end

  private
  def signed_in_user
    unless signed_in?
      redirect_to root_url, notice: "You need to sign in before you can play games."
    end
  end

end
