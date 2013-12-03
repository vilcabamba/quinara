# encoding: utf-8
module EvaluacionFormatoValidations
  extend ActiveSupport::Concern

  included do
    validate :matches_formato
  end

  def find_on_secciones_by_tipo(tipo)
    secciones.each do |seccion|
      return seccion if seccion.tipo == tipo.capitalize
    end
    nil
  end
  def written_secciones
    secciones.select do |seccion|
      Seccion.written_kinds.include? seccion.tipo
    end
  end
  def oral_secciones
    secciones.select do |seccion|
      Seccion.oral_kinds.include? seccion.tipo
    end
  end
  def matches_formato
    if course.evaluacion_formato
      formato = course.evaluacion_formato
      number_of_this_evaluacion = if course.evaluaciones.count > 3
        course.evaluaciones.count - 2
      else
        course.evaluaciones.count + 1
      end
      unless formato.term[:written].blank?
        written_puntaje = 0
        written_secciones.each do |section|
          written_puntaje += section.puntaje
        end
        errors.add(:base, "La sección Writing debe valer #{formato.term[:written]} puntos") unless written_puntaje == formato.term[:written].to_i
      end
      unless formato.term[:oral].blank?
        oral_puntaje = 0
        oral_secciones.each do |section|
          oral_puntaje += section.puntaje
        end
        errors.add(:base, "La sección Oral debe valer #{formato.term[:oral]} puntos") unless oral_puntaje == formato.term[:oral].to_i
      end
      formato.term[number_of_this_evaluacion.to_s.to_sym].each do |section, parameters|
        if parameters[:not_allowed]
          errors.add(:base, "No puede tener #{section.capitalize}") if secciones.exists?(tipo: section.capitalize)
        else
          if not seccion = find_on_secciones_by_tipo(section.capitalize)
            errors.add :base, "Falta una sección de #{section.capitalize}"
          else
            if not parameters[:preguntas].blank? and seccion.questions.length != parameters[:preguntas].to_i
              errors.add :base, "La sección de #{section.capitalize} debe tener #{parameters[:preguntas]} preguntas"
            end
            if not parameters[:puntos].blank?
              if not parameters[:preguntas].blank?
                seccion.questions.each do |question|
                  errors.add(:base, "Cada pregunta de #{section.capitalize} debe valer #{parameters[:puntos]} puntos") unless question.puntaje_maximo == parameters[:puntos].to_i
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

end
