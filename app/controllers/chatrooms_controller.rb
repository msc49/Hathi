class ChatroomsController < ApplicationController

  
  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.public_room
    @users = User.all_excluding_current_user(current_user)
    # exclude current user
  end


  def create
    @chatroom = Chatroom.create(name: params['chatroom']['name'])
  end
end
