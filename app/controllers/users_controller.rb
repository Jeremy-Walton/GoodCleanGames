class UsersController < ApplicationController
  before_filter :http_authenticate
  skip_before_filter :verify_authenticity_token, only:[:token]

  def new
  end

  def show
    render json: User.find(params[:id])
  end

  def token
    current_user.refresh_authentication_token!
    token = current_user.authentication_token
    render json: { id: current_user.id, token: token }
  end

end
