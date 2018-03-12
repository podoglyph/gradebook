class Teacher::AuthController < ApplicationController
  before_action :authorize

  def authorize
    if !current_user
      render_403
    elsif current_user && !current_user.teacher?
      render_403
    end
  end
end
