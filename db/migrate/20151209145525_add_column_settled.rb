class AddColumnSettled < ActiveRecord::Migration
  def change
    add_column :students,:settled,:boolean
    add_index :students,:settled
  end
end
