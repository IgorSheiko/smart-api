class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :project_name

  has_many :rooms, serializer: RoomSerializer
end
