class EmployeesController < ApplicationController

  def index
      @employee = Employee.all
    end



end
