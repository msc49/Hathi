class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  after_create_commit { broadcast_append_to chatroom }
  has_many_attached :attachments, dependent: :destroy


    def chatroom_file(index)
      file = attachments[index]
      if file.video? or file.image?
        file.variant(resize_to_limit: [150,150]).processed
      end
    end
end
