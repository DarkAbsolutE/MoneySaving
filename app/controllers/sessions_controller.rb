class SessionsController < ApplicationController
  def create
    employee = Employee.from_omniauth(env["omniauth.auth"])
    session[:employee_id] = employee.id
    redirect_to root_path
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_path
  end
end
