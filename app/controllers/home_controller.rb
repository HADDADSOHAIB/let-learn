class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @thoughts = Thought.all.includes(author: [:photo_attachment, :cover_image_attachment])
    @thought = Thought.new
    @to_follow = User.where.not(id: current_user).where.not(id: current_user.followeds)
  end
end
