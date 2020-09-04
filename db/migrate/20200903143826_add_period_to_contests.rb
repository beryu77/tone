class AddPeriodToContests < ActiveRecord::Migration[5.2]
  def change
    add_column :contests, :period, :string
  end
end
