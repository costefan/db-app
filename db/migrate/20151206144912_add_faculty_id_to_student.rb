class AddFacultyIdToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :faculty, index: true, foreign_key: true
  end
end
