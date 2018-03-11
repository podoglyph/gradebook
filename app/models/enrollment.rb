class Enrollment < ApplicationRecord
  validates_presence_of :grade, :user_id, :semester_course_id

  belongs_to :user
  belongs_to :semester_course


  def self.course_enrollment(course, semester)
    semester_course = SemesterCourse.find_by(course_id: course, semester_id: semester)

    joins(:user)
      .where("enrollments.semester_course_id = ?", semester_course.id)
      .select("enrollments.id, users.first_name, users.last_name, enrollments.grade AS grade")
  end

end
