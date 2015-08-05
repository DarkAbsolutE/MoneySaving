class SalariesController < ApplicationController

  def update
    @salary = Salary.find(params[:id])
    if @salary.update_attributes(salary_params)
      redirect_to employees_path
    else
      flash[:notice] = "Please, try again"
    end
  end

  private

  def salary_params
    params.require(:salary).permit(:amount)
  end
end
