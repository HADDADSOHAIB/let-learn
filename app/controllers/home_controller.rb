class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @thoughts = Thought.time_line(current_user)
    @thought = Thought.new
    @to_follow = User.where.not(id: current_user).where.not(id: current_user.followeds)
  end
end
