class Admin::DashboardController < ApplicationController

  def index
    @semesters
    @semester_enrollments = Semester.total_enrollments
  end

end
