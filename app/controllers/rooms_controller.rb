class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = current_user.rooms.includes(:users).order(last_message: :desc)
  end


  def show
    @rooms = current_user.rooms.includes(:users).order(last_message: :desc)
  end

  private
  def set_room
    @room = Room.includes(:messages).find(params[:id])
  end
end
