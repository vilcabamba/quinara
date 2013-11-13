class UserAnswer < ActiveRecord::Base

# relations
  belongs_to :user
  belongs_to :answer
  belongs_to :question

# validations
  validates :user_id, presence: true
  validates :question_id, presence: true

# callbacks
  before_save :set_score_to_float_if_necessary

# serializations
  serialize :content
  serialize :written_answer_grade

# class methods
  def self.answer!(options)
    user = options[:user]
    options[:questions].each do |question_id, value|
      new(user: user).tap do |answer|
        answer.assign_attributes Question.process_answer question_id, value
        answer.save!
      end
    end
  end

# methods
  def set_score_to_float_if_necessary
    if written_answer_grade
      written_answer_grade[:score] = written_answer_grade[:score].to_f
    end
  end
  def written_answer_grade_score
    written_answer_grade[:score] if written_answer_grade
  end
  def written_answer_grade_text
    written_answer_grade[:text] if written_answer_grade
  end

end
