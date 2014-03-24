class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    games_url
  end
  def after_sign_up_path_for(resource)
    games_url
  end

  private
  def http_authenticate
    authenticate_or_request_with_http_basic do |email, password|
      user = User.find_by(email: email)
      user && user.valid_password?(password)
    end
  end

  def authenticate_for_api
    request_http_basic_authentication unless
      authenticate_with_http_basic do |id, token|
        user = User.find(id: id)
        if user && Devise.secure_compare(user.authentication_token, token)
          sign_in user, store: false
        end
      end
  end

end