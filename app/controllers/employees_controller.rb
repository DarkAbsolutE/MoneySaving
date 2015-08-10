class EmployeesController < ApplicationController

  before_action :check_session

  def index
    @employees = Employee.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to employees_path
    else
      flash[:notice] = "Please, try again"
    end
  end

  def update_status
    @employee = Employee.find(params[:id])
    @employee.status = !@employee.status
    @employee.save
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :paypal_email, :status)
  end

end
