class Faculty < ActiveRecord::Base
  has_many :students
  has_many :faculty_hostels
  has_many :hostels, through: :faculty_hostels

  def as_json(options = {})
    super(options.merge(include: :students))
  end
end
