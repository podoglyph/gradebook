class Admin::DashboardController < Admin::AuthController
  before_action :auth

  def index
    @semester_courses = SemesterCourse.average_course_grades
    @semester_enrollments = Semester.total_enrollments
  end

end
