class CreateStudentBenefits < ActiveRecord::Migration
  def change
    create_table :student_benefits do |t|
      t.integer :student_id
      t.integer :benefit_id
      t.timestamps null: false
    end
    add_index :student_benefits,:benefit_id
    add_index :student_benefits,:student_id
  end
end
