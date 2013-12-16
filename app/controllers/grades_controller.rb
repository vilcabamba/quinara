class GradesController < ApplicationController
  
  before_action :require_login

  def show
    if params[:id].to_i == current_user.id
      @user = current_user
    elsif current_user.admin
      @user = User.find params[:id]
    else
      redirect_to root_path
      return
    end
    @evaluaciones = @user.given_evaluaciones
  end
  
end
