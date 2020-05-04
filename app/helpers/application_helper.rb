module ApplicationHelper

  def following?(user)
    current_user.followeds.include?(user)
  end

  def like?(thought, user)
    thought.liked_users.include?(user)
  end
end
