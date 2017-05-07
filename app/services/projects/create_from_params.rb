module Projects
  class CreateFromParams
    attr_reader :params, :user

    def self.call(user, params)
      new(user, params).call
    end

    def initialize(user, params)
      @params = params
      @user = user
    end

    def call
      @project = user.projects.build(project_params)
      user.save!
      params[:rooms].each do |room, value|
        new_room = Rooms::CreateFromParams.call(@project.id, value)
      end
    end

    private

    def project_params
      params.permit(:project_name)
    end

  end
end
