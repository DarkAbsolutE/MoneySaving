class HomesController < ApplicationController

  before_action :destroy, :only => [:show]
  def show

  end

  def login
  end

  private

  def destroy
    if session[:employee_id] == nil
      redirect_to root_path
    end
  end



end
