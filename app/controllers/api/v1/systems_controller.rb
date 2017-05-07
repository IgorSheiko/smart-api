class Api::V1::SystemsController < ApplicationController
  def index
    systems = System.all
    render json: systems
  end
end
