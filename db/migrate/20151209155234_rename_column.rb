class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :benefit_categories,:name,:benefit_name
  end
end
