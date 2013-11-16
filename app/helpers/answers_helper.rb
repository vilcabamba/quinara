module AnswersHelper

  def string_status_for_answer_on_choose(user_answer, question)
    if status_for_answer_on_choose user_answer, question
      "success"
    else
      "error"
    end
  end
  def status_for_answer_on_choose(user_answer, question)
    return nil unless user_answer
    user_answer.content[question.id.to_s] == question.opcion
  end

  def string_status_for_true_false(user_answer, question)
    if status_for_true_false user_answer, question
      "success"
    else
      "error"
    end
  end
  def status_for_true_false(user_answer, question)
    return nil unless user_answer
    user_answer.content == question.bool_answer
  end

  def string_status_for_answer(user_answer, answer)
    if answer.answered_this?(user_answer)
      if status_for_answer user_answer, answer
        "success"
      else
        "error"
      end
    end
  end
  def status_for_answer(user_answer, answer)
    answer.answered_this?(user_answer) and answer.correcta
  end

end
