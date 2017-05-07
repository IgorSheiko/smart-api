module Rooms
  class CreateFromParams
    attr_reader :params, :project_id

    def self.call(project_id, params)
      new(project_id, params).call
    end

    def initialize(project_id ,params)
      @params = params
      @project_id = project_id
    end

    def call
      add_system_ids
      Room.create(room_params)
    end

    private

    def room_params
      params.permit(:room_category_id, :project_id, system_ids: [])
    end

    def add_system_ids
      params[:project_id] = project_id
      params[:system_ids] = []
      params[:systems].each do |system|
         params[:system_ids] << System.find_by(system_name: system).id
      end
    end
  end
end
