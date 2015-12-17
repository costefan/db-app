class FacultiesController < ApplicationController
  def index
    respond_with Faculty.all
  end

  def show
    respond_with Faculty.find(params[:id])
  end

  def show_by_hostels
     respond_with Faculty.find_by_sql(['SELECT * FROM faculties
              INNER JOIN faculty_hostels ON (faculties.id = faculty_hostels.faculty_id)
              INNER JOIN hostels ON (hostels.id = faculty_hostels.hostel_id)
                  WHERE hostels.number = ?', params[:id]])
  end

  def add_hostel
    hostel = Hostel.find_by(number: params[:hostel_number])
    FacultyHostel.find_by_sql(['INSERT INTO faculty_hostels (faculty_id, hostel_id, created_at, updated_at) VALUES (?, ?, ?, ?)', params[:faculty_id], hostel.id, Time.now, Time.now])
    respond_with hostel
  end

  def destroy_hostel
    FacultyHostel.find_by_sql([' DELETE FROM faculty_hostels
                          WHERE faculty_hostels.faculty_id = ?
                          AND faculty_hostels.hostel_id =
                          (SELECT id FROM hostels WHERE hostels.number = ?) ', params[:faculty_id], params[:hostel_number]])
    respond_with Hostel.find_by(number: params[:hostel_number])
  end

  def add_student
    faculty = Faculty.find(params[:faculty_id])
    student = faculty.students.create!(name: params[:name], age: params[:age])
    unless params[:benefit].nil?
      benefit = BenefitCategory.find_or_create_by(benefit_name: params[:benefit])
      StudentBenefit.create!(student_id: student.id, benefit_category_id: benefit.id)
    end
    respond_with Student.find(student.id)
  end


end


