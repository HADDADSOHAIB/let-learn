class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:show]
  before_action :secure_room, only: [:show]

  def index
    @rooms = current_user.rooms.includes(:users).order(last_message: :desc)
  end


  def show
    @rooms = current_user.rooms.includes(:users).order(last_message: :desc)
    if !@room
      redirect_to rooms_path, alert: "Room does not exist or you are not a member"
    end
  end

  private
  def set_room
    @room = Room.includes(:messages).find_by_id(params[:id])
  end

  def secure_room
    if @room && !@room.users.include?(current_user)
      @room = nil
    end
  end
end
