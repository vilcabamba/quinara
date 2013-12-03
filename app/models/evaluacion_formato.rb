class EvaluacionFormato < ActiveRecord::Base


# relationships
  belongs_to :course

# validations
  validates :course_id, presence: true

# serializations
  serialize :formato

# methods
  def term
    formato[:terms][:"1"]
  end
  def status_for(evaluacion, section)
    status = term[evaluacion.to_s.to_sym][section]
    return :not_allowed if status[:not_allowed]
    status
  end
  def status_text_for(evaluacion, section)
    status = status_for evaluacion, section
    text = []
    if status == :not_allowed
      text << "No permitido"
    else
      text << "#{status[:preguntas]} preguntas" unless status[:preguntas].blank?
      text << "#{status[:puntos]} puntos" unless status[:puntos].blank?
      if not status[:preguntas].blank? and not status[:puntos].blank?
        text.last.concat " c/u"
      end
    end
    text
  end

end
