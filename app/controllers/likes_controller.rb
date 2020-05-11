class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_thought, only: %i[create destroy]

  def create
    @like = Like.new(thought: @thought, user: current_user)
    respond_to { |format| format.js } if @thought && @like.save
  end

  def destroy
    @like = Like.find_by(thought: @thought, user: current_user)

    respond_to { |format| format.js } if @thought && @like.destroy
  end

  private

  def set_thought
    @thought = Thought.find(params[:thought_id])
  end
end
