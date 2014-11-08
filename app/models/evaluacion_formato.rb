# == Schema Information
#
# Table name: evaluacion_formatos
#
#  id        :integer          not null, primary key
#  course_id :integer          not null
#  formato   :text
#

class EvaluacionFormato < ActiveRecord::Base
# relationships
  belongs_to :course

# validations
  validates :course_id, presence: true

# serializations
  serialize :formato

# callbacks
  before_save :adjust_from_formatos_count!

# methods
  def term
    formato[:terms][:"1"]
  end

  def points_for_section(section)
    term[section]
  end

  def adjust_from_formatos_count!
    # old implementation
    # evaluaciones_indexes.each do |index|
    #   if index.to_i > formatos_count
    #     # let's delete formatos for evaluaciones greater than number of formatos
    #     term.delete index
    #   end
    # end
    if formatos_count.to_i == 2 && evaluaciones_indexes.include?("2")
      term.delete "2"
    end
  end

  def evaluaciones_indexes
    term.keys.reject {|key|
      # let's select only evaluacion numbers
      %w(written oral).include?(key)
    }
  end

  def status_for(evaluacion, section)
    return {} unless term.include?(evaluacion.to_s.to_sym)
    status = term[evaluacion.to_s.to_sym][section]
    return :not_allowed if status[:not_allowed]
    status
  end

  def should_render?(index)
    if formatos_count == 2 && index.to_i == 2
      false
    else
      true
    end
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
    if text.length == 0
      text << "Abierto"
    end
    text
  end
end
