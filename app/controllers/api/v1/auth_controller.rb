class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate, except: [:sign_out]

  def sign_in
    user = User.find_by(email: signin_params[:email]).try(:authenticate, signin_params[:password])
    if user
      user.generate_authentication_token!
      render json: user
    else
      render_with_errors(401, email: 'not found')
    end
  end

  def sign_up
    user = Users::CreateFromParams.call(params)
    if user
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 401
    end
  end

  def sign_out
    current_user.update_attributes(authentication_token: nil)
    render json: {}
  end

  private

  def signin_params
    params.require(:auth).permit(:email, :password)
  end
end