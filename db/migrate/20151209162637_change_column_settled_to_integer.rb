class ChangeColumnSettledToInteger < ActiveRecord::Migration
  def change
    remove_column :students,:hostel_id
  end
end
