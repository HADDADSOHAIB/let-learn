class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = Following.new(following_params)
    @user = following.followed
    @room_id = Room.create_room(@user, current_user)

    respond_to { |format| format.js { render :follow } } if following.save && @room_id
  end

  def destroy
    following = Following.find_by(following_params)
    @user = following.followed

    respond_to { |format| format.js { render :unfollow } } if following.destroy
  end

  private

  def following_params
    params.require(:follow).permit(:followed_id, :follower_id)
  end
end
