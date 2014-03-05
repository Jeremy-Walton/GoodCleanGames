class GamesController < ApplicationController
	 before_action :signed_in_user, only: :index
	def home
	end
	def index
	end
	def create
		@game = Games.new(game_params)
		if @game.save
			render json: @game.data
		else
			render nothing: true, status: 400
		end
	end

	def show

	end

	def lookup
		game = Games.find_by(game_type: params[:game_type], name: params[:name])
		if game
			render json: game.data
		else
			render nothing: true, status: :not_found
		end
	end

	private
		def signed_in_user
      		unless signed_in?
        		redirect_to root_url, notice: "You need to sign in before you can play games."
      		end
		end
		def game_params
      		params.permit(:game_type, :name, :data)
    	end
end
