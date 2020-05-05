class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = Following.new(following_params)
    @user = following.followed
    if following.save
      respond_to do |format|
        format.js {render :follow}
      end
    end
  end

  def destroy
    following = Following.find_by(following_params)
    @user = following.followed
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
