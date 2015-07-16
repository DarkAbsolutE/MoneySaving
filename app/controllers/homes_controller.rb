class HomesController < ApplicationController
  before_action :check_session, :only => [:show]

  def show

  end

  def login
    if session[:employee_id] != nil
      redirect_to home_path
    end
  end

end
