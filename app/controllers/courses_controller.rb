class CoursesController < ApplicationController
  
  before_action :set_course, only: :show

  def index
    redirect_to root_path
  end

  def show
  end

  private

  def set_course
    @course = current_user.courses.find params[:id]
  end
  
end
