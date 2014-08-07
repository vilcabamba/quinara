# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  texto       :string(255)      not null
#  correcta    :boolean          default(FALSE)
#  question_id :integer
#  opcion      :string(255)
#

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
