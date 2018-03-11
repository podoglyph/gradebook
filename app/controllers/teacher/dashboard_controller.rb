class Teacher::DashboardController < ApplicationController

  def index
    @courses = Course.teacher_courses(current_user)
  end

end
