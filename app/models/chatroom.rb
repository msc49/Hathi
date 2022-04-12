class Chatroom < ApplicationRecord
  scope :public_room, -> { where(private_room: false) }
  validates_uniqueness_of :name
end
