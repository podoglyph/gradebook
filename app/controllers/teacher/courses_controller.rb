class Teacher::CoursesController < ApplicationController

  def show
    @course_data = Course.view_course(course_params, semester_params[:semester_term])
    @student_data = Enrollment.teacher_course_enrollment(course_params, semester_params[:semester_id].to_i)
  end

  private

    def course_params
      params.require(:id).to_i
    end

    def semester_params
      params.require(:semester).permit(:semester_id, :semester_term)
    end

end
