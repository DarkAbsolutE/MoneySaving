class EmployeesController < ApplicationController

  before_action :check_session, :check_database_existance

  def index
    @employees = Employee.all
  end

  def edit
    @employee = Employee.find(params[:id])
    @salary = Salary.find(params[:id])
    @saving_company = SavingCompany.find(params[:id])
    @saving_employee = SavingEmployee.find(params[:id])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to home_path
    else
      flash[:notice] = "Please, try again"
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :paypal_email, :status, salary_attributes:[:amount])
  end

end
