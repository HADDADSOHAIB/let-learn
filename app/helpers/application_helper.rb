module ApplicationHelper

  def following?(user)
    current_user.followeds.include?(user)
  end

  def like?(thought, user)
    thought.liked_users.include?(user)
  end

  def room_colleague_name(room)
    if room.users[0].id == current_user.id
      room.users[1].fullname
    else
      room.users[0].fullname
    end
  end

  def room_unread_messages(room)

    first_user = room.join_user_rooms[0]
    last_user = room.join_user_rooms[1]
    
    if first_user.user_id == current_user.id
      return (first_user.unread_messages ? first_user.unread_messages : 0)
    else
      return (last_user.unread_messages ? last_user.unread_messages : 0)
    end
  end

  def user_unread_messages(user)
    joins = user.join_user_rooms

    count = 0
    joins.each do |join|
      count += join.unread_messages if join.unread_messages
    end

    count
  end
end
