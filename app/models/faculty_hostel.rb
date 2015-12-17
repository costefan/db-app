class FacultyHostel < ActiveRecord::Base
  belongs_to :faculty
  belongs_to :hostel
end
