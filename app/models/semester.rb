class Semester < ApplicationRecord
  validates_presence_of :term

  has_many :semester_courses
  has_many :courses, through: :semester_courses
end
