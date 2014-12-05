class RespuestasController < DocenteController
  before_filter :find_evaluacion

  def index
    @users = @evaluacion.users
  end

  def show
    @user = @evaluacion.users.find params[:id]
    @show_details = true
    @date = @user.user_answers.where(question_id: @evaluacion.questions_ids).first.created_at
  end

  private

  def find_evaluacion
    @evaluacion = @course.evaluaciones.find params[:evaluacion_id]
  end

end
