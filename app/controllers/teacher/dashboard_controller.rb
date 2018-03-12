class Teacher::DashboardController < Teacher::AuthController

  def index
    @courses = Course.teacher_courses(current_user)
  end

end
