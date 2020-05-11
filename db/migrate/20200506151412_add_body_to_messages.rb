class AddBodyToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :body, :text
  end
end
