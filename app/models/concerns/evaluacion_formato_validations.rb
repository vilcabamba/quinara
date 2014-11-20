# encoding: utf-8
module EvaluacionFormatoValidations
  extend ActiveSupport::Concern

  included do
    validate :matches_formato
  end

  def course_is_tiny_kids?
    !!course.is_tiny_kids? # cast to boolean
  end
  def number_of_evaluacion
    @number_of_evaluacion ||= course.number_of_evaluacion(self)
  end
  def find_on_secciones_by_tipo(tipo)
    secciones.detect {|seccion| seccion.tipo == tipo.capitalize}
  end
  def written_secciones
    secciones.select {|seccion| Seccion.written_kinds.include?(seccion.tipo)}
  end
  def written_secciones_puntaje
    written_secciones.inject(0.0) {|sum, section| sum + section.puntaje }
  end
  def oral_secciones
    secciones.select {|seccion| Seccion.oral_kinds.include?(seccion.tipo)}
  end
  def oral_secciones_puntaje
    oral_secciones.inject(0.0) {|sum, seccion| sum + seccion.puntaje}
  end
  def matches_formato
    if course_is_tiny_kids?
      validate_tiny_kids!
    elsif course.evaluacion_formato
      validate_formato!
    end
  end
  def validate_tiny_kids!
    errors.add(:base, "Tiny kids solamente puede tener preguntas de Speaking o Listening") if written_secciones.any?
  end
  def validate_formato!
    formato = course.evaluacion_formato
    unless formato.term[:written].blank?
      errors.add(:base, "Written debe valer #{formato.term[:written]} puntos") unless written_secciones_puntaje == formato.term[:written].to_i
    end
    unless formato.term[:oral].blank?
      errors.add(:base, "Oral debe valer #{formato.term[:oral]} puntos") unless oral_secciones_puntaje == formato.term[:oral].to_i
    end
    formato.term[number_of_evaluacion.to_s.to_sym].each do |section, parameters|
      if parameters[:not_allowed]
        errors.add(:base, "No puede tener #{section.capitalize}") if find_on_secciones_by_tipo(section.capitalize)
      else
        if not seccion = find_on_secciones_by_tipo(section.capitalize)
          unless number_of_evaluacion == 2 and (section.capitalize == "Vocabulary" or section.capitalize == "Writing") and (find_on_secciones_by_tipo("Vocabulary") or find_on_secciones_by_tipo("Writing"))
            errors.add :base, "Falta una sección de #{section.capitalize}"
          end
        else
          if not parameters[:preguntas].blank? and seccion.questions.length != parameters[:preguntas].to_i
            errors.add :base, "La sección de #{section.capitalize} debe tener #{parameters[:preguntas]} preguntas"
          end
          if not parameters[:puntos].blank?
            if not parameters[:preguntas].blank?
              seccion.questions.each do |question|
                unless question.puntaje_maximo == parameters[:puntos].to_i
                  error_message = "Cada pregunta de #{section.capitalize} debe valer #{parameters[:puntos]} puntos"
                  errors.add(:base, error_message) unless errors[:base].include?(error_message)
                end
              end
            else
              errors.add(:base, "La sección #{section.capitalize} debe valer #{parameters[:puntos]} puntos") unless seccion.puntaje == parameters[:puntos].to_i
            end
          end
        end
      end
    end
  end

end
