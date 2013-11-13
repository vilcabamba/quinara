module QuestionsHelper

  def status_for_question(question)
    if question.score_for_user(current_user) == 0
      "error"
    elsif question.score_for_user(current_user) == question.puntaje_maximo
      "success"
    else
      "warning"
    end
  end

end
