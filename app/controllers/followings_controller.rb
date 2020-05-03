class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def follow
    following = Following.new(following_params)
    if following.save
      respond_to do |format|
        format.js {render :follow}
      end
    end
  end

  def unfollow
    following = Following.where(following_params)
    if following.destroy
      respond_to do |format|
        format.js {render :unfollow}
      end
    end
  end
  private 
  def following_params
    params.require(:follow).permit(:followed_id, :follower_id)
  end
end
