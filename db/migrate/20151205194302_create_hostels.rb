class CreateHostels < ActiveRecord::Migration
  def change
    create_table :hostels do |t|
      t.integer :number,null: false
      t.string :head_name,null: false
      t.integer :roominess,null: false
      t.integer :number_occupied,null: false
      t.timestamps null: false
    end
  end
end
