class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :followed
      t.references :follower

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :followed_id
    add_foreign_key :followings, :users, column: :follower_id
  end
end
