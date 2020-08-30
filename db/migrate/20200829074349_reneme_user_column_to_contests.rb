class RenemeUserColumnToContests < ActiveRecord::Migration[5.2]
  def change
    rename_column :contests, :user, :user_id
  end
end
