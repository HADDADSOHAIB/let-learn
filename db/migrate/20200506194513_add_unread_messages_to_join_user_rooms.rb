class AddUnreadMessagesToJoinUserRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :join_user_rooms, :unread_messages, :integer
  end
end
