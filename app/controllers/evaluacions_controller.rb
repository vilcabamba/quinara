# encoding: utf-8
class EvaluacionsController < DocenteController

  before_action :find_evaluacion, only: [:edit, :show, :view, :update, :calificar, :calificar_respuestas, :delete_my_answer, :remove_file]

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
  end

  def show
    if @evaluacion.taken_by? current_user
      redirect_to action: :view, id: params[:id]
    end
    @user = current_user
  end

  def edit
  end

  def view
    unless @evaluacion.taken_by? current_user
      render :show
    else
      @user = current_user
      @show_details = true
      @date = @user.user_answers.where(question_id: @evaluacion.questions.select(:id)).first.created_at
      render "respuestas/show"
    end
  end

  def calificar
    @questions = @evaluacion.questions_to_calificar
    @answers = UserAnswer.where(question_id: @questions.select(:id))
  end

  def calificar_respuestas
    @user_answer = @evaluacion.user_answers.find(params[:user_answer_id])
    @user_answer.written_answer_grade = { score: params[:score], text: params[:text] }
    @user_answer.save
  end

  def create
    @evaluacion = @course.evaluaciones.new(params[:evaluacion].permit!)
    if @evaluacion.save
      flash["alert-success"] = "Evaluación creada"
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if @evaluacion.update_attributes(params[:evaluacion].permit!)
      flash["alert-success"] = "Evaluación actualizada"
      redirect_to action: :index
    else
      render :new
    end
  end

  def delete_my_answer
    UserAnswer.destroy_all user_id: current_user.id, question_id: @evaluacion.questions.select(:id)
    redirect_to action: :show, id: params[:id]
  end

  def remove_file
    @question = @evaluacion.questions.find params[:question_id]
    @question.remove_media!
    @question.save
  end

  private

  def find_evaluacion
    @evaluacion = @course.evaluaciones.includes(questions: :answers).find params[:id]
  end

end
