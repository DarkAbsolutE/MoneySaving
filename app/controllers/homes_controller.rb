class HomesController < ApplicationController
  before_action :check_session, only: [:index]

  def login
    if session[:employee_id] != nil
      redirect_to homes_path
    else
      @disable_nav = true
    end
  end

  def index
    @employees = Employee.all
  end

end
