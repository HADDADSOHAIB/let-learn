class JoinUserRoomsController < ApplicationController
  def reset_unread
    room = Room.find(params[:room_id])
    first_user = room.join_user_rooms[0]
    last_user = room.join_user_rooms[1]
    
    if first_user.user_id == current_user.id
      first_user.update(unread_messages: 0)
    else
      last_user.update(unread_messages: 0)
    end

    respond_to do |format|
      format.js { render :json => {ok: 1} }
    end
  end
end