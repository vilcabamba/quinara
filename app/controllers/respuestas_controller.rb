class RespuestasController < DocenteController
  
  before_filter :find_evaluacion

  def index
    @users = @evaluacion.users
  end

  private

  def find_evaluacion
    @evaluacion = @course.evaluaciones.find params[:evaluacion_id]
  end
  
end
