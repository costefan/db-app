class StudentBenefit < ActiveRecord::Base
  belongs_to :student
  belongs_to :benefit_category
end
