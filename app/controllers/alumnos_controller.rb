class AlumnosController < ApplicationController
  
  before_action :set_course

  def show
    @alumnos = {
      ya: @course.students,
      no: @course.not_students
    }
  end

  private

  def set_course
    @course = Course.find params[:id]
  end
  
end
