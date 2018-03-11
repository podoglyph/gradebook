class SessionsController < ApplicationController

  def check_role_for_redirect
    if current_user.teacher?
      redirect_to teacher_dashboard_index_path
    elsif current_user.student?
      redirect_to student_dashboard_index_path
    elsif current_user.admin?
      redirect_to admin_dashboard_index_path
    else
      false
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully Logged In as #{@user.first_name}."
      check_role_for_redirect
    else
      flash[:login_error] = "Login Error: incorrect username or password."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
