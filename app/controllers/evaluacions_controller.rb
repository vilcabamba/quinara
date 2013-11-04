class EvaluacionsController < ApplicationController

  before_action :set_course, only: :show

  def new
    @evaluacion = Evaluacion.new
  end

  def edit
  end

  def show
    
  end

  private

  def set_course
    @course = Course.find params[:id]
  end

end
