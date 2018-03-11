class SemesterCourse < ApplicationRecord
  belongs_to :course
  belongs_to :semester

  has_many :enrollments
  has_many :users, through: :enrollments
  
end
