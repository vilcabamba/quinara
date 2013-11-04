class CoursesController < ApplicationController
  
  def index
    redirect_to root_path
  end

  def show
    @course = Course.find params[:id]
  end
  
end
