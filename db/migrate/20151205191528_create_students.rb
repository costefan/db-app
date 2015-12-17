class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name,null: false,limit: 30
      t.integer :age,null: false
      t.timestamps null: false
    end
  end
end
