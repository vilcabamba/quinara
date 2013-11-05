class EvaluacionsController < DocenteController

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
  end

  def edit
    @evaluacion = @course.evaluaciones.find params[:id]
    render :new
  end

  def create
    @evaluacion = @course.evaluaciones.new(params[:evaluacion].permit!)
    @evaluacion.save!
    redirect_to action: :index
  end

end
