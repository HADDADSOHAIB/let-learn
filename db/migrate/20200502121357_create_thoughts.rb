class CreateThoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :thoughts do |t|
      t.text :text
      t.references :author

      t.timestamps
    end

    add_foreign_key :thoughts, :users, column: :author_id
  end
end
