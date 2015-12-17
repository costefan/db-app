class ChangeColumnSettledToInt < ActiveRecord::Migration
  def change
    add_column :students,:hostel_id,:integer,default: 0
  end
end
