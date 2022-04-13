class MessagesController < ApplicationController

  def create
    @message = current_user.messages.create(body: params_message[:body], chatroom_id: params[:chatroom_id])
  end

  private

  def params_message
    params.require(:message).permit(:body)
  end
end
