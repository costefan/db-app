class RenameColumnStudentBenefits < ActiveRecord::Migration
  def change
    rename_column :student_benefits, :benefit_id, :benefit_category_id
  end
end
