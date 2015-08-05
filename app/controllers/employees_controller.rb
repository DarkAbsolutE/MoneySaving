class EmployeesController < ApplicationController

  before_action :check_session, :check_database_existance

  def index
    @employees = Employee.all
  end

  def edit
    @employee = Employee.find(params[:id])
    @salary = Salary.find(params[:id])
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

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :paypal_email, :status)
  end

end
