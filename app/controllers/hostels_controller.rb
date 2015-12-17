class HostelsController < ApplicationController

  def show
    respond_with Hostel.find(params[:id])
  end

  def show_by_faculty
    faculty = Faculty.find_by_sql(['SELECT * FROM faculties
                                        WHERE id = ?', params[:id]])[0]
    respond_with Hostel.find_by_sql(['SELECT * FROM hostels
                                        INNER JOIN faculty_hostels ON (hostels.id = faculty_hostels.hostel_id)
                                     WHERE faculty_hostels.faculty_id = ?', faculty.id])
  end

  def add_student
     Student.find_by_sql(['UPDATE students SET hostel_id =
                                      (SELECT id FROM hostels WHERE number = ?)
                                      WHERE id = ?', params[:hostel_number], params[:student_id]])
     Hostel.find_by_sql(['UPDATE hostels SET number_occupied = number_occupied +1
                                      WHERE number = ?', params[:hostel_number]])
     respond_with Student.find(params[:student_id])
  end

  def show_not_by_faculty
    faculty = Faculty.find(params[:id])
    all_hostels = Hostel.all
    result = all_hostels - faculty.hostels
    respond_with result
  end

  def search_avg
    respond_with Hostel.find_by_sql(['select avg(roominess-number_occupied) from hostels'])
  end

  def search_already
    respond_with Hostel.find_by_sql(['select hostel_id,count(hostel_id) from students
    inner join student_benefits on (students.id = student_benefits.student_id)
    inner join benefit_categories on (student_benefits.benefit_category_id = benefit_categories.id) where hostel_id = 0
    group by hostel_id;'])
  end

  def students_count
    respond_with Faculty.find_by_sql(['SELECT faculties.full_name,count(*) FROM faculties
		INNER JOIN students ON (faculties.id = students.faculty_id)
              INNER JOIN faculty_hostels ON (faculties.id = faculty_hostels.faculty_id)
              INNER JOIN hostels ON (hostels.id = faculty_hostels.hostel_id)
                  WHERE hostels.number = ? AND students.hostel_id != 0
                  group by faculties.id;', params[:id]])
  end

  def already_placed
    respond_with Faculty.find_by_sql(['SELECT students.name,faculties.full_name FROM faculties
		INNER JOIN students ON (faculties.id = students.faculty_id)
              INNER JOIN faculty_hostels ON (faculties.id = faculty_hostels.faculty_id)
              INNER JOIN hostels ON (hostels.id = faculty_hostels.hostel_id)
                  WHERE hostels.number = ? AND students.hostel_id != 0
                 ', params[:id]])
  end

end
