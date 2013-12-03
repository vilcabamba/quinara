# encoding: utf-8
class AnswerEvaluacionController < ApplicationController
  
  before_action :require_login
  before_action :validate_user_belongs_to_course, only: [:create]
  before_action :find_evaluacion, only: [:show, :view]

  def show
    redirect_to(action: :view, id: params[:id]) if @evaluacion.taken_by? current_user
    render :closed unless @evaluacion.open?
    @user = current_user
  end

  def view
    if not @evaluacion.taken_by? current_user
      redirect_to action: :show, id: params[:id]
    else
      @user = current_user
      @date = @user.user_answers.where(question_id: @evaluacion.questions_ids).first.created_at
      render "respuestas/show"
    end
  end

  def create
    UserAnswer.answer! user: current_user, questions: params[:questions].permit!
    flash["alert-success"] = "Respondiste a la evaluación"
    if current_user.is_teacher_in_course?(@evaluacion.course)
      redirect_to view_course_evaluacion_path(@evaluacion.course, @evaluacion)
    else
      redirect_to action: :view, id: params[:evaluacion_id]
    end
  end

  private

  def validate_user_belongs_to_course
    @evaluacion = Evaluacion.find params[:evaluacion_id]
    unless current_user.belongs_to_course? @evaluacion.course
      redirect_to root_path
      false
    end
    if @evaluacion.taken_by? current_user
      redirect_to root_path
      false
    end
  end

  def find_evaluacion
    @evaluacion = Evaluacion.where(course_id: current_user.courses_as_student).includes(questions: :answers).find params[:id]
    @course = @evaluacion.course
  end
  
end
