class Room < ActiveRecord::Base
  belongs_to :project
  belongs_to :room_category
  has_many :systems, through: :rooms_systems
  has_many :rooms_systems
end
