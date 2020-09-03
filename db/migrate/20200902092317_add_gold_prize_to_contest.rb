class AddGoldPrizeToContest < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :gold_prize, :string
    add_column :contests, :silver_prize, :string
    add_column :contests, :win_a_prize, :string
  end
end
