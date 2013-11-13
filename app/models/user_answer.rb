class UserAnswer < ActiveRecord::Base

# relations
  belongs_to :user
  belongs_to :answer
  belongs_to :question

# validations
  validates :user_id, presence: true
  validates :question_id, presence: true

# serializations
  serialize :content

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

end
