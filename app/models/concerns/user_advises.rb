# encoding: utf-8
module UserAdvises
  def advises
    if @advises then return @advises end
    @advises = Array.new
    if last_evaluacion_failed_in
      @advises << "Estás fallando en #{last_evaluacion_failed_in.join(", ")}"
    end
    if has_evaluaciones_pendientes?
      @advises << "Tienes #{evaluaciones_pendientes.count} evaluaciones pendientes"
    end
    @advises
  end
  def last_evaluacion_failed_in
    @last_evaluacion_failed_in ||=  last_evaluacion.user_failed_in(self) if last_evaluacion
  end
  def has_evaluaciones_pendientes?
    evaluaciones_pendientes.length > 0
  end
end
