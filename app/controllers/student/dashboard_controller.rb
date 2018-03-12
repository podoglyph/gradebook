class Student::DashboardController < Student::AuthController

  def index
    @course_data = SemesterCourse.student_courses(current_user)

    if student_enrolled?
      @semesters_gpa = Enrollment.gpa(current_user)
    else
      @non_enrollment = "You have not enrolled in any courses, ever."
    end
  end

  private

    def student_enrolled?
      current_user.enrollments.any?
    end
end
