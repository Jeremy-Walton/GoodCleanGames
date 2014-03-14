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
      @game = Game.new(game_type: "I Doubt It", name: current_user.email, data: '', users: [current_user], number_of_players: number_of_players, number_of_robots: 0)
      if @game.save
        redirect_to waiting_i_doubt_it_path(@game.id)
      end
    elsif (params[:gametype] == 'old')
      @game = Game.find(params[:game_id])
      @game.users << current_user
      redirect_to waiting_i_doubt_it_path(@game.id)
    else
      number_of_robots = params[:number_of_robots].to_i
      @game = Game.new(game_type: "I Doubt It", name: current_user.email, data: '', users: [current_user], number_of_robots: number_of_robots)
      if @game.save
        redirect_to i_doubt_it_path(@game.id)
      end
    end

  end

  def update
    if (params[:refresh] == true)
      update_game(params[:id])
    else
      @game = Game.find_by(game_type: params[:game_type], id: params[:id])
      @game.data = params[:data]
      if @game.save
        update_game(params[:id])
        render nothing: true
      else
        render nothing: true, status: :not_found
      end
    end
  end

  def update_game(id)
    puts "Hello"
    Pusher[id].trigger('reload_page', {
      message: ''
    })
  end

  private
  def signed_in_user
    unless signed_in?
      redirect_to root_url, notice: "You need to sign in before you can play games."
    end
  end

end
