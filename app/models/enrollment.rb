class Enrollment < ApplicationRecord
  validates_presence_of :grade, :user_id, :semester_course_id
  
  belongs_to :user
  belongs_to :semester_course
end
