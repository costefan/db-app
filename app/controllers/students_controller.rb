class StudentsController < ApplicationController

  def index
    respond_with Student.find_by_sql(['SELECT students.id,students.name,students.age,benefit_categories.benefit_name FROM students INNER JOIN student_benefits ON (students.id = student_benefits.student_id)
                                        INNER JOIN benefit_categories ON (student_benefits.benefit_category_id = benefit_categories.id)
                                        WHERE students.faculty_id = ? AND students.hostel_id = 0', params[:id]])
  end

  def students_without_benefits
    students = Student.find_by_sql(['SELECT * FROM students WHERE faculty_id = ? AND students.hostel_id = 0
                                       AND id NOT IN
                                        (SELECT student_id FROM student_benefits)', params[:id]])
    respond_with students
  end

end
