class Evaluacion < ActiveRecord::Base
  #relationships
  belongs_to :course
  has_many :questions

  #nested
  accepts_nested_attributes_for :questions
end
