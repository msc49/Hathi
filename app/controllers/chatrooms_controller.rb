class ChatroomsController < ApplicationController

  
  def index
    @chatrooms = Chatroom.public_room
    @users = User.all_excluding_current_user(current_user)
    # exclude current user
  end
end
