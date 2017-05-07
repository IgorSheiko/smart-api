class Api::V1::UsersController < ApplicationController
  def update
    user = Users::UpdateFromParams.call(current_user, params)

    render json: user
  end

  def show
    user = User.find(params[:id])

    render json: user, serializer: OtherUserSerializer
  end
end
