class MessagesController < ApplicationController
  def create
    message_params = params.require(:message).permit(:room_id, :body)
    new_message = Message.new(user: current_user,
      room_id: message_params[:room_id],
      body: message_params[:body])

    if new_message.save
      ActionCable.server.broadcast "chat:#{new_message.room_id}", {message: new_message, body: render(partial: 'message', locals: {message: new_message})}
    end
  end
end