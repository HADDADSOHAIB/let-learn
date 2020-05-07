class Room < ApplicationRecord
  has_many :join_user_rooms, dependent: :destroy
  has_many :users, through: :join_user_rooms

  has_many :messages, dependent: :destroy

  def self.create_room(first_user, second_user)
    rooms = Room.joins(join_user_rooms: :user).where(users: {id: first_user.id}) & Room.joins(join_user_rooms: :user).where(users: {id: second_user.id})
    if rooms.size == 0
      room = Room.new
      room.save && JoinUserRoom.create(room: room, user: first_user) && JoinUserRoom.create(room: room, user: second_user)
    else
      true
    end
  end
end