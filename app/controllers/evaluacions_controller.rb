class EvaluacionsController < DocenteController

  def index
    @evaluaciones = @course.evaluaciones
  end

  def new
    @evaluacion = @course.evaluaciones.new
  end

  def create
    @evaluacion = @course.evaluaciones.new(params[:evaluacion].permit!)
    raise "not so fast, sweetie"
  end

end
