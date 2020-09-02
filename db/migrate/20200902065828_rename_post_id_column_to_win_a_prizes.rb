class RenamePostIdColumnToWinAPrizes < ActiveRecord::Migration[5.2]
  def change
    rename_column :win_a_prizes, :post_id, :contest_post_id
  end
end
