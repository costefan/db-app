class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name ,null: false,:limit => 10
      t.string :full_name ,null: false,:limit => 60
      t.string :address, :limit => 60
      t.string :person, null: false, :limit => 60
      t.timestamps null: false
    end
  end
end
