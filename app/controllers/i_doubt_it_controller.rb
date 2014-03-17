class IDoubtItController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :show, :new, :create]

  def new

  end

  def show
    @game = IDoubtItGame.find(params[:id])
    # @game = Game.find(params[:id])
    render (@game.has_enough_users? ? :show : :waiting)
  end

  def index
    @games = IDoubtItGame.all
  end

  def create
    number_of_players = params[:number_of_players].to_i + 1
    number_of_robots = params[:number_of_robots].to_i
    @game = IDoubtItGame.new(name: current_user.email, data: '', users: [current_user], number_of_players: number_of_players, number_of_robots: number_of_robots, round_result: '') #may need to check whether or not there are robots
    if @game.save
      increment_times_played
      redirect_to i_doubt_it_path(@game.id)
    end
  end

  def update
    @game = IDoubtItGame.find(params[:game_id])
    @game.users << current_user
    increment_times_played
    redirect_to i_doubt_it_path(@game.id)
  end

  private

    def increment_times_played
      statistic = Stat.find_by(game_type: 'I Doubt It', user_id: current_user.id)
      statistic = Stat.new(game_type: 'I Doubt It', user_id: current_user.id, times_played: 0, wins: 0, losses: 0) unless statistic
      statistic.times_played += 1
      statistic.save
    end

end
