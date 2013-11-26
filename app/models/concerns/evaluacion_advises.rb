module EvaluacionAdvises
  def user_failed_in(user)
    failed_in = Array.new
    questions.each do |question|
      user_answer = question.user_answers.find_by user_id: user.id
      unless question.answered_correctly?(user_answer)
        failed_in << question.seccion.tipo unless failed_in.include?(question.seccion.tipo)
      end
    end
    failed_in
  end
end
