class CoursesController < ApplicationController
  
  before_action :set_course, only: :show
  before_action :verify_currentuser_belongs_to_course, only: :show

  def index
    redirect_to root_path
  end

  def show
  end

  private

  def set_course
    @course = Course.find params[:id]
  end
  def verify_currentuser_belongs_to_course
    unless current_user.belongs_to_course?(@course)
      redirect_to root_path
    end
  end
  
end
