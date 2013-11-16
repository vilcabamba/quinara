module UserEvaluaciones
  def given_evaluaciones
    Evaluacion.where(id: Question.where(id: user_answers.select(:question_id)).select(:evaluacion_id))
  end
  def last_evaluacion
    @last_evaluacion ||= given_evaluaciones.last
  end
  def evaluaciones_pendientes
    if @evaluaciones_pendientes then return @evaluaciones_pendientes end
    @evaluaciones_pendientes = []
    all_evaluaciones.each do |evaluacion|
      @evaluaciones_pendientes << evaluacion unless evaluacion.taken_by?(self)
    end
    @evaluaciones_pendientes
  end
end
