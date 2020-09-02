class RenamePostIdColumnToGoldPrizes < ActiveRecord::Migration[5.2]
  def change
    rename_column :gold_prizes, :post_id, :contest_post_id
  end
end
