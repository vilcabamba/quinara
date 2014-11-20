module EvaluacionsHelper

  def literal(int)
    (int + 97).chr
  end

  def formato_class_for(current, max, type=:preguntas, number=1)
    number = 1 if number.blank?
    correct = type == :preguntas ? (current.to_f == max.to_f) : (current.to_f == max.to_f * number.to_f)
    if max.blank? || correct
      "text-success"
    elsif current.to_f < max.to_f
      "text-info"
    else
      "text-error"
    end
  end
end
