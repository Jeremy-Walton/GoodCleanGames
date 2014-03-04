class GamesController < ApplicationController
	 before_action :signed_in_user, only: :index
	def home
	end
	def index
	end

	private
		def signed_in_user
      		unless signed_in?
        		redirect_to root_url, notice: "You need to sign in before you can play games."
      		end
		end
end
