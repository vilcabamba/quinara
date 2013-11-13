# encoding: utf-8
class EvaluacionsController < DocenteController

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
  end

  def show
    @evaluacion = @course.evaluaciones.includes(questions: :answers).find params[:id]
    if @evaluacion.taken_by? current_user
      render :view
    end
  end

  def edit
    @evaluacion = @course.evaluaciones.includes(questions: :answers).find params[:id]
    render :new
  end

  def view
    @evaluacion = @course.evaluaciones.includes(:questions).find params[:id]
    unless @evaluacion.taken_by? current_user
      render :show
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
    @evaluacion = @course.evaluaciones.find params[:id]
    if @evaluacion.update_attributes(params[:evaluacion].permit!)
      flash["alert-success"] = "Evaluación actualizada"
      redirect_to action: :index
    else
      render :new
    end
  end

end
