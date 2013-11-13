class CoursesController < ApplicationController
  
  before_action :set_course, only: :show

  def index
    redirect_to root_path
  end

  def show
    if current_user.is_student_in_course?(@course)
      @evaluaciones = @course.evaluaciones
    end
  end

  private

  def set_course
    @course = current_user.courses.find params[:id]
  end
  
end
