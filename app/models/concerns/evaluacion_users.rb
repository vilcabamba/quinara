module EvaluacionUsers
  def users
    User.where(id: user_answers.select(:user_id).distinct)
  end
  def taken_by?(user)
    user_answers.exists? user_id: user.id
  end
  def score_for(user)
    score = 0
    questions.each do |question|
      score += question.score_for_answer UserAnswer.find_by(user_id: user.id, question_id: question.id)
    end
    score
  end
end
