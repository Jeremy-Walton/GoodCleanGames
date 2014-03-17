# class GamesController < ApplicationController
#   before_action :signed_in_user, only: [:index, :show]

#   private
#   def signed_in_user
#     unless signed_in?
#       redirect_to root_url, notice: "You need to sign in before you can play games."
#     end
#   end
#   def game_params
#     params.permit(:game_type, :name, :data, :round_result)
#   end
# end
