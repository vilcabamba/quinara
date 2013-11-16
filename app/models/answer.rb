class Answer < ActiveRecord::Base

# relationships
  belongs_to :question
  has_many :user_answers

# validations

# methods
  def answered_this?(user_answer)
    return nil unless user_answer
    user_answer.answer_id == id
  end

end
