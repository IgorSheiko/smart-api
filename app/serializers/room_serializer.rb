class RoomSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :room_category, serializer: RoomCategorySerializer
  has_many :systems, serializer: SystemSerializer
end
