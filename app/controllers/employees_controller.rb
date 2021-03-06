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
      redirect_to homes_path
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
    params.require(:employee).permit(:photo_url, :name, :email, :paypal_email, :status, salary_attributes:[:amount],
                                     saving_employee_attributes:[:amount], saving_company_attributes:[:amount])
  end

end
