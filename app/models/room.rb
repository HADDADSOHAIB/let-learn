class Room < ApplicationRecord
  has_many :join_user_rooms
  has_many :users, through: :join_user_rooms

  has_many :messages
end
