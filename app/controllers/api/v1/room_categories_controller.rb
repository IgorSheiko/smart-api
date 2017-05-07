class Api::V1::RoomCategoriesController < ApplicationController
  def index
    category = RoomCategory.all
    render json: category
  end
end
