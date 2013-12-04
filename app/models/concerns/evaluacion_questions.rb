module EvaluacionQuestions
  def is_worth_ten_points
    puntos = questions.inject(0.0) {|sum, question| sum + question.puntaje_maximo.to_f }
    errors.add(:base, "Debe valer 10 puntos") unless puntos == 10
  end
  def has_all_sections
    errors.add(:base, "Debe tener Writing") unless questions.any?(&:is_writing)
    errors.add(:base, "Debe tener Grammar") unless questions.any?(&:is_grammar)
    errors.add(:base, "Debe tener Listening") unless questions.any?(&:is_listening)
  end
  def has_preguntas_to_calificar?
    questions.exists? kind: ["Escriba la respuesta", "Pregunta Oral"]
  end
  def questions_to_calificar
    questions.where(kind: ["Escriba la respuesta", "Pregunta Oral"])
  end
  def questions_ids
    questions.select("questions.id")
  end
  def max_score
    questions.inject(0.0) {|sum, question| sum + question.puntaje_maximo.to_f }
  end
end
