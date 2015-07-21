class HomesController < ApplicationController
  before_action :check_session, :only => [:show]


  def login

    if session[:employee_id] != nil
      redirect_to home_path
    else
      @disable_nav = true
    end
  end

end
