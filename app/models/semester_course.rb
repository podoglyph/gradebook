class SemesterCourse < ApplicationRecord
  belongs_to :course
  belongs_to :semester

  has_many :enrollments
  has_many :users, through: :enrollments

  def self.enrolled_students(course, semester)
    joins(:enrollments, :users)
      .where(course_id: course, semester_id: semester)
      .select("users.first_name AS first_name, users.last_name AS last_name, enrollments.grade AS grade")
  end

end
