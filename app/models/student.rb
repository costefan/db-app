class Student < ActiveRecord::Base
  has_many :student_benefits
  has_many :benefit_categories, through: :student_benefits
end
