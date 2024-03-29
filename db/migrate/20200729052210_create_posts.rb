class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :caption
      t.string :location
      t.string :equipment
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :posts, %i[user_id created_at]
  end
end
