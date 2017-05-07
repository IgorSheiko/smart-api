class RoomsSystem < ActiveRecord::Base
  belongs_to :system
  belongs_to :room
end
