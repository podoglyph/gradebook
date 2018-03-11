class Teacher::CoursesController < ApplicationController

  def show
    @course_data = Course.view_course(course_params, semester_params[:semester_term])
    @student_data = SemesterCourse.enrolled_students(course_params, semester_params)
  end

  private

    def course_params
      params.require(:id).to_i
    end

    def semester_params
      params.require(:semester).permit(:semester_id, :semester_term)
    end

end
