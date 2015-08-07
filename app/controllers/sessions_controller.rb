class SessionsController < ApplicationController
  def create
    @employee = Employee.from_omniauth(env["omniauth.auth"])
    if @employee.is_admin
      session[:employee_id] = @employee.id
      redirect_to home_path
      flash[:notice] = "Log in succesful"
    else
      flash[:notice] = "You're not admin bro..."
      redirect_to root_path
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_path
  end
end
