class Hostel < ActiveRecord::Base
  has_many :faculty_hostels
  has_many :faculties, through: :faculty_hostels
end
