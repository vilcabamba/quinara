# encoding: utf-8
class EvaluacionsController < DocenteController

  before_action :find_evaluacion, only: [:edit, :show, :view, :update, :calificar, :calificar_respuestas, :delete_my_answer, :remove_file, :reuse_evaluacion]

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
  end

  def show
    redirect_to(action: :view, id: params[:id]) if @evaluacion.taken_by? current_user
    @user = current_user
  end

  def reuse
    @evaluaciones = @course.evaluaciones
  end

  def reuse_evaluacion
    @evaluacion = @evaluacion.reuse
    render :new
  end

  def edit
  end

  def view
    unless @evaluacion.taken_by? current_user
      render :show
    else
      @user = current_user
      @show_details = true
      @date = @user.user_answers.where(question_id: @evaluacion.questions_ids).first.created_at
      render "respuestas/show"
    end
  end

  def calificar
    @questions = @evaluacion.questions_to_calificar
    @users = User.where id: UserAnswer.where(question_id: @questions.select("questions.id")).select(:user_id)
  end

  def calificar_respuestas
    @user = User.find(params[:user_id])
    params[:answers].each do |answer_id, answer_score|
      @user.user_answers.find_by(id: answer_id, question_id: @evaluacion.questions_ids).tap do |user_answer|
        user_answer.written_answer_grade = { score: answer_score[:score], text: answer_score[:text] }
        user_answer.save
      end
    end
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
    UserAnswer.destroy_all user_id: current_user.id, question_id: @evaluacion.questions_ids
    redirect_to action: :show, id: params[:id]
  end

  def remove_file
    @object = if params[:type] == "Seccion"
      @evaluacion.secciones.find params[:object_id]
    else
      @evaluacion.questions.find params[:object_id]
    end
    @object.remove_media!
    @object.save
  end

  private

  def find_evaluacion
    @evaluacion = @course.evaluaciones.includes(questions: :answers).find params[:id]
  end

end
