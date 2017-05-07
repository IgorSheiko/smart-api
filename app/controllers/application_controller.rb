class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from Pundit::NotAuthorizedError, with: :forbidden
  include Pundit

  before_action :authenticate

  attr_reader :current_user

  def render_with_errors(status = 422, *errors)
    render json: { errors: errors }, status: status
  end

  protected

  def authenticate
    authenticate_or_request_with_http_token do |authentication_token, _options|
      @current_user = User.find_by(authentication_token: authentication_token)
    end

    unless @current_user
      user_not_authorized
      return false
    end
  end

  def user_not_authorized
    head :unauthorized
  end

  def forbidden
    render json: { errors: [{ status: 403, title: 'not allowed' }] },
           status: 403
  end
end
