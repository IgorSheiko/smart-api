class Api::V1::ValidationsController < ApplicationController
  skip_before_action :authenticate, only: [:auth_exists, :email_exists, :phone_number_valid]

  def auth_exists
    user = found_user.try(:authenticate, params[:password])

    render json: { exists: !!user }
  end

  def email_exists
    rslt = if params[:email] == params[:old_email]
             false
           else
             found_user.present?
           end

    render json: { exists: rslt }
  end

  def password_valid
    valid_password = BCrypt::Password.new(current_user.password_digest) == params[:password]
    render json: { valid: valid_password }
  end

  def phone_number_valid
    profile = Profile.find_by(phone_number: params[:phone_number])

    render json: { exists: !!profile }
  end

  private

  def found_user
    User.find_by(email: params[:email])
  end
end
