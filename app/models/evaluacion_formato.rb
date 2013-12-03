class EvaluacionFormato < ActiveRecord::Base


# relationships
  belongs_to :course

# validations
  validates :course_id, presence: true

# serializations
  serialize :formato

end
