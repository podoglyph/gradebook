class Course < ApplicationRecord
  validates_presence_of :name, :user_id

  belongs_to :user
  has_many :semester_courses
  has_many :semesters, through: :semester_courses
end
