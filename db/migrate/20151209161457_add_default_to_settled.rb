class AddDefaultToSettled < ActiveRecord::Migration
  def change
    change_column :students,:settled,:boolean,default: false
  end
end
