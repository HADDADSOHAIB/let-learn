class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @thoughts = Thought.time_line(current_user)
    @thought = Thought.new
    @to_follow = User.to_follow(current_user)
  end
end
