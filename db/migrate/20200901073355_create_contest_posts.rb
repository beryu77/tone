class CreateContestPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :contest_posts do |t|
      t.text :caption
      t.string :equipment
      t.string :image
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
