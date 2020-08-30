class AddTitleToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :title, :string
    add_column :contests, :main, :text
    add_column :contests, :condition, :text
  end
end
