class AddGoldPrizeTitleToContest < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :gold_title, :string
    add_column :contests, :gold_explanation, :string
    add_column :contests, :silver_title, :string
    add_column :contests, :silver_explanation, :string
    add_column :contests, :win_title, :string
    add_column :contests, :win_explanation, :string
  end
end
