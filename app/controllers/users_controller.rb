class UsersController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def show
    render json: User.find(params[:id])
  end

end
