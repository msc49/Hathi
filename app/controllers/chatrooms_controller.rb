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


  # def create
  #   @chatroom = Chatroom.new(chatroom_params)
  #   @chatroom.save
  # end


  # private

  # def chatroom_params
  #   params.require(:chatroom).permit(:name)
  # end


end
