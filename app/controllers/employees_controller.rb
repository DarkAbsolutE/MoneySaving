class EmployeesController < ApplicationController
  before_action :check

  def edit
    @employee = Employee.find(params[:id])

  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      # Handle a successful update.
      redirect_to employee_path
    else
      flash[:notice] = "There was an error somewhere"
    end
  end

  def employee_params
      params.require(:employee).permit(:name, :email, :paypal_email, :status)
  end


  private

  def check
    if session[:employee_id] == nil
      redirect_to root_path
    end
  end
end
