class RenamePostIdColumnToSilverPrizes < ActiveRecord::Migration[5.2]
  def change
    rename_column :silver_prizes, :post_id, :contest_post_id
  end
end
