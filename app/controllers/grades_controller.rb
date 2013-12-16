class GradesController < ApplicationController
  
  def index
    
  end

  def show
    if params[:id].to_i == current_user.id
      @user = current_user
    else
      redirect_to root_path
      return
    end
    @evaluaciones = @user.given_evaluaciones
  end
  
end
