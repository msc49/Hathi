class MessagesController < ApplicationController

  def create
    @message = current_user.messages.create(body: params_message[:body], chatroom_id: params[:chatroom_id], attachments: params_message[:attachments])
  end

  private

  def params_message
    params.require(:message).permit(:body, attachments: [])
  end
end
