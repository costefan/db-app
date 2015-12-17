class BenefitCategory < ActiveRecord::Base
  has_many :student_benefits
  has_many :students, through: :student_benefits
end
