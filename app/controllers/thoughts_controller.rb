class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_thought, only: %i[edit update destroy]

  def create
    @thought = Thought.new(thought_params)

    respond_to do |format|
      if @thought.save
        format.html { redirect_to root_path, notice: 'Thought was successfully created.' }
      else
        format.html { redirect_to root_path, alert: @thought.errors.full_messages.join('. ') }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @thought.update(thought_params)
        format.html { redirect_to root_path, notice: 'Thought was successfully updated.' }
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @thought.destroy

    respond_to do |format|
      format.html { redirect_to thoughts_url, notice: 'Thought was successfully destroyed.' }
      format.js { render :destroy }
    end
  end

  private

  def set_thought
    @thought = Thought.find(params[:id])
  end

  def thought_params
    params.require(:thought).permit(:text, :author_id)
  end
end
