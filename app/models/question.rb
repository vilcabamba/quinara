class Question < ActiveRecord::Base
  #relationships
  belongs_to :evaluacion
  has_many :answers
  has_many :usuario_respuestas

  #nested
  accepts_nested_attributes_for :answers

end
