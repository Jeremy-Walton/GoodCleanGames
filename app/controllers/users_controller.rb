class UsersController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def name
    render json: current_user
  end
end
