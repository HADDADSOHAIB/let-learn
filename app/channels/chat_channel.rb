class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.rooms.each do |room|
      stream_from "chat:#{room.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
