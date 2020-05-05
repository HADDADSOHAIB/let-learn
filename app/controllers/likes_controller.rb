class LikesController < ApplicationController
  before_action :set_thought, only: %i[create destroy]

  def create
    @like = Like.new(thought: @thought, user: current_user)
  
    if @thought && @like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    p params
    @like = Like.find_by(thought: @thought, user: current_user)
    if @thought && @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_thought
    @thought = Thought.find(params[:thought_id])
  end
end