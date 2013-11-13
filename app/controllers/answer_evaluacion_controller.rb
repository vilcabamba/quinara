# encoding: utf-8
class AnswerEvaluacionController < ApplicationController
  
  before_action :require_login
  before_action :validate_user_belongs_to_course

  def create
    UserAnswer.answer! user: current_user, questions: params[:questions].permit!
    flash["alert-success"] = "Respondiste a la evaluación"
    redirect_to view_course_evaluacion_path(@evaluacion.course, @evaluacion)
  end

  private

  def validate_user_belongs_to_course
    @evaluacion = Evaluacion.find params[:evaluacion_id]
    unless current_user.belongs_to_course? @evaluacion.course
      redirect_to root_path
      false
    end
  end
  
end
