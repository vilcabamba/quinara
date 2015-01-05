# encoding: utf-8
class EvaluacionsController < DocenteController
  before_action :find_evaluacion, only: [:edit, :show, :view, :update, :calificar, :calificar_respuestas, :delete_my_answer, :remove_file, :reuse_evaluacion, :destroy]

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
    @evaluacion.save validate: false
    render :edit
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
    unless @evaluacion.destroyable?
      flash["alert-error"] = "No se puede editar evaluación. Ya contiene respuestas"
      redirect_to action: :index
    end
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
        user_answer.written_answer_score = answer_score[:score]
        user_answer.written_answer_grade = answer_score[:text]
        user_answer.save
      end
    end
  end

  def create
    @evaluacion = @course.evaluaciones.new(evaluacion_params)
    if @evaluacion.save(validate: false)
      flash["alert-success"] = "Evaluación creada"
      redirect_to action: :index
    else
      render :new
    end
  end

  def validate
    original = @course.evaluaciones.find(params[:id])
    @evaluacion = @course.evaluaciones.new(evaluacion_params_for_validate)
    @evaluacion.instance_variable_set(:@number_of_evaluacion, original.number_of_evaluacion)
  end

  def update
    if @evaluacion.update_attributes(evaluacion_params)
      flash["alert-success"] = "Evaluación actualizada"
      redirect_to action: :index
    else
      render :edit
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

  def destroy
    if @evaluacion.destroyable?
      @evaluacion.destroy
      flash["alert-success"] = "Evaluación terminada"
    else
      flash["alert-error"] = "No se puede eliminar evaluación. Ya contiene respuestas"
    end
    redirect_to action: :index
  end

  private

  def find_evaluacion
    @evaluacion = @course.evaluaciones.includes(questions: :answers).find params[:id]
  end

  def formato_term
    @evaluacion.evaluacion_formato.term
  end
  helper_method :formato # will be used in views

  def method_name
    formato_term[@evaluacion.number_of_evaluacion.to_s.to_sym]
  end

  def evaluacion_params
    params[:evaluacion].permit(*evaluacion_allowed_attrs)
  end

  def evaluacion_params_for_validate
    hash = evaluacion_params
    hash[:secciones_attributes].each do |key, value|
      if value["_destroy"].to_i === 1
        hash.delete(key)
      else
        value.delete(:id) if value.has_key?(:id)
        if value[:questions_attributes]
          value[:questions_attributes].each do |k, v|
            if v["_destroy"].to_i === 1
              value[:questions_attributes].delete(k)
            else
              v.delete("id") if v.has_key?("id")
            end
          end
        end
      end
    end
    unless hash[:id]
      hash[:id] = params[:id]
    end
    hash
  end

  def evaluacion_allowed_attrs
    [
      :nombre,
      :available_from,
      :available_to,
      secciones_attributes: [
       :tipo,
       :instruccion,
       :media_cache,
       :_destroy,
       :id,
       questions_attributes: [
         :texto,
         :puntaje_maximo,
         :media_cache,
         :kind,
         :bool_answer,
         :_destroy,
         :id
       ]
      ]
    ]
  end
end
