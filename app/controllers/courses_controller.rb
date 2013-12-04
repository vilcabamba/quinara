class CoursesController < ApplicationController
  
  before_action :set_course, only: [:show, :formato_evaluaciones]

  def index
    redirect_to root_path
  end

  def show
    if current_user.is_student_in_course?(@course)
      @evaluaciones = @course.evaluaciones
    end
  end

  def formato_evaluaciones
    render text: "Este curso no tiene un formato definido" unless @course.evaluacion_formato
  end

  private

  def set_course
    @course = current_user.courses.find params[:id]
  end
  
end
