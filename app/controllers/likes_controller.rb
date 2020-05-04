class LikesController < ApplicationController
  before_action :set_thought, only: %i[like unlike]

  def like
    @like = Like.new(thought: @thought, user: current_user)
  
    if @thought && @like.save
      respond_to do |format|
        format.js {render :like}
      end
    end
  end

  def unlike
    @like = Like.find_by(thought: @thought, user: current_user)
    if @thought && @like.destroy
      respond_to do |format|
        format.js {render :unlike}
      end
    end
  end

  private
  def set_thought
    @thought = Thought.find(params[:id])
  end
end