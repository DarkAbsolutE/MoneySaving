class HomesController < ApplicationController
  before_action :check_session, :only => [:show]

  def login
    if session[:employee_id] != nil
      redirect_to home_path
    else
      @disable_nav = true
    end
  end

  def show
    @employees = Employee.all
    @salaries = Salary.all
    @saving_companies = SavingCompany.all
    @saving_employees = SavingEmployee.all
    @total_amounts = TotalAmount.all 
  end

end
