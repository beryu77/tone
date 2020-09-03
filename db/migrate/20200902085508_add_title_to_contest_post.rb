class AddTitleToContestPost < ActiveRecord::Migration[5.2]
  def change
    add_column :contest_posts, :title, :string
  end
end
