class Chatroom < ApplicationRecord
  scope :public_room, -> { where(private_room: false) }
  validates_uniqueness_of :name
  after_create_commit {broadcast_append_to "chatrooms"}
end
