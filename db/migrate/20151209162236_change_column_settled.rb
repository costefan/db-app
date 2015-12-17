class ChangeColumnSettled < ActiveRecord::Migration
  def change
    rename_column :students,:settled,:hostel_id
  end
end
