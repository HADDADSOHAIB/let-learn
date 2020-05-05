class CommentsController < ApplicationController
  before_action :set_thought, only: [:show]

  def show
    
    respond_to do |format|
      format.js
    end
  end

  private
  def set_thought
    @thought = Thought.find(params[:id])
  end

end