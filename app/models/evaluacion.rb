class Evaluacion < ActiveRecord::Base
  #relationships
  belongs_to :course
  has_many :questions
end
