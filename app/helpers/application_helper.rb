module ApplicationHelper

  def following?(user)
    current_user.followeds.include?(user)
  end
end
