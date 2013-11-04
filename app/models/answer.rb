class Answer < ActiveRecord::Base
  #relationships
  belongs_to :question
  has_many :usuario_respuestas
end
