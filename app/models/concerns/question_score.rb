module QuestionScore
  def answer_for_user(user)
    @answer_for_users ||= {}
    @answer_for_users[user.id] or add_answer_for_user(UserAnswer.find_by(user_id: user.id, question_id: id))
  end
  def add_answer_for_user(answer)
    return nil unless answer
    @answer_for_users ||= {}
    @answer_for_users[answer.user.id] = answer
  end
  def score_for_user(user)
    unless instance_variable_get(:"@score_for_user_#{user.username}")
      logger.debug "setting score for user #{user.username}"
      @score = score_for_answer answer_for_user(user)
      instance_variable_set(:"@score_for_user_#{user.username}", @score)
    end
    instance_variable_get :"@score_for_user_#{user.username}"
  end
  def answered_correctly?(answer)
    puntaje_maximo == score_for_answer(answer)
  end
  def score_for_answer(answer)
    return 0 unless answer
    add_answer_for_user answer
    case kind
    when "Seleccionar una opción"
      if answers.find(answer.answer_id).correcta then puntaje_maximo else 0 end
    when "Verdadero o Falso"
      if bool_answer == answer.content then puntaje_maximo else 0 end
    when "Escriba la respuesta"
      if answer.written_answer_grade then answer.written_answer_grade[:score] else 0 end
    when "Pregunta oral"
      if answer.written_answer_grade then answer.written_answer_grade[:score] else 0 end
    when "Escoja la respuesta"
      score = 0
      each_score = puntaje_maximo.to_f / answers.count
      answer.content.each do |answer_id, value|
        if answers.find(answer_id).opcion == value
          score += each_score
        end
      end
      score
    end
  end
end
