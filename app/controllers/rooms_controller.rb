class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]
  before_action :secure_room, only: [:show]

  def index
    @rooms = Room.user_rooms(current_user)
  end

  def show
    @rooms = Room.user_rooms(current_user)
    redirect_to rooms_path, alert: 'Room does not exist or you are not a member' unless @room
  end

  private

  def set_room
    @room = Room.includes(:messages).find_by_id(params[:id])
  end

  def secure_room
    @room = nil if @room && !@room.users.include?(current_user)
  end
end
