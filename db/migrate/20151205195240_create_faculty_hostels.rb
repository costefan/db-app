class CreateFacultyHostels < ActiveRecord::Migration
  def change
    create_table :faculty_hostels do |t|
      t.integer :faculty_id
      t.integer :hostel_id
      t.timestamps null: false
    end
    add_index :faculty_hostels,:faculty_id
    add_index :faculty_hostels,:hostel_id
  end
end
