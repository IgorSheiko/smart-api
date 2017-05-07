class System < ActiveRecord::Base
  has_many :rooms, through: :rooms_systems
  has_many :rooms_systems
end
