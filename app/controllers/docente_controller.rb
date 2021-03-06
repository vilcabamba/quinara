class DocenteController < ApplicationController

  before_action :require_login, :set_course

  protected

  def set_course
    @course = current_user.courses_as_teacher.find params[:course_id]
  end

end
