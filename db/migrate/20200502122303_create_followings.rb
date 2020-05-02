class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :followed, foreign_key: true
      t.references :follower, foreign_key: true

      t.timestamps
      add_foreign_key :followings, :users, column: :followed_id
      add_foreign_key :followings, :users, column: :follower_id
    end
  end
end
