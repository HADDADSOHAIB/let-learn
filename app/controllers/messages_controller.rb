class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message_params = params.require(:message).permit(:room_id, :body)
    new_message = Message.new(user: current_user, room_id: message_params[:room_id], body: message_params[:body])
    room = new_message.room
    room.update(last_message: Time.zone.now)

    first_user = room.join_user_rooms[0]
    last_user = room.join_user_rooms[1]

    if first_user.user_id == current_user.id
      first_user.update(unread_messages: 0)
      last_user.update(unread_messages: (last_user.unread_messages ? last_user.unread_messages + 1 : 1))
    else
      last_user.update(unread_messages: 0)
      first_user.update(unread_messages: (first_user.unread_messages ? first_user.unread_messages + 1 : 1))
    end

    return unless new_message.save

    ActionCable.server.broadcast "chat:#{new_message.room_id}",
                                 { message: new_message, body: render(partial: 'message',
                                                                      locals: { message: new_message }) }
  end
end
