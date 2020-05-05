class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, foreign_key: true
      t.references :thought, foreign_key: true

      t.timestamps
    end
  end
end
