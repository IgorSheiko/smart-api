class Api::V1::ProjectsController < ApplicationController
  def create
    project = Projects::CreateFromParams.call(current_user, params)
    render json: {}
  end

  def index
    projects = current_user.projects
    render json: projects, include:  ['rooms', 'rooms.room_category', 'rooms.systems'] 
  end
end
