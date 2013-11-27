module EvaluacionQuestions
  def is_worth_ten_points
    puntos = 0
    questions.each do |question|
      puntos += question.puntaje_maximo.to_f
    end
    errors.add(:base, "Debe valer 10 puntos") unless puntos == 10
  end
  def has_all_sections
    errors.add(:base, "Debe tener Writing") unless questions.any?(&:is_writing)
    errors.add(:base, "Debe tener Grammar") unless questions.any?(&:is_grammar)
    errors.add(:base, "Debe tener Listening") unless questions.any?(&:is_listening)
  end
  def has_preguntas_to_calificar?
    questions.exists? kind: "Escriba la respuesta"
  end
  def questions_to_calificar
    questions.where(kind: "Escriba la respuesta")
  end
  def questions_ids
    questions.select("questions.id")
  end
  def max_score
    puntos = 0.0
    questions.each do |question|
      puntos += question.puntaje_maximo.to_f
    end
    puntos
  end
end
