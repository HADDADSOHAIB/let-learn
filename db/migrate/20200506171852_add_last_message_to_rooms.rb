class AddLastMessageToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :last_message, :datetime
  end
end
