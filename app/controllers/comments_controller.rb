class CommentsController < ApplicationController
  before_action :set_thought, only: [:show]

  def show
    @comment = Comment.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @thought = @comment.thought
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { redirect_to root_path, alert: @comment.errors.full_messages.join(". ") }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @like = Like.find_by(thought: @thought, user: current_user)
  #   if @thought && @like.destroy
  #     respond_to do |format|
  #       format.js {render :unlike}
  #     end
  #   end
  # end

  private
  def set_thought
    @thought = Thought.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :thought_id)
  end
end