class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.integer :user
      t.string :image

      t.timestamps
    end
  end
end
