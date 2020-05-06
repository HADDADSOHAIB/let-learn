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
end
