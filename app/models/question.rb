# encoding: utf-8
# == Schema Information
#
# Table name: questions
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  texto          :string(255)      not null
#  puntaje_maximo :float            not null
#  kind           :string(255)
#  section        :string(255)
#  bool_answer    :boolean
#  media          :string(255)
#  seccion_id     :integer
#

class Question < ActiveRecord::Base
  include QuestionScore
  include QuestionKinds
  include QuestionAnswers
  include EvaluacionMediaFiles

# uploaders
  mount_uploader :media, QuestionMediaUploader

# relationships
  belongs_to :seccion
  has_many :answers
  has_many :user_answers

# nested
  accepts_nested_attributes_for :answers, allow_destroy: true

# validations
  validates :puntaje_maximo, numericality: { greater_than: 0, message: "Puntaje máximo de la pregunta no es un número" },
                             presence: { message: "Pregunta debe tener un puntaje máximo" }
  validates :texto, presence: { message: "Pregunta debe tener una instrucción" }, unless: Proc.new { |question| question.kind == "Pregunta oral" }
  validates :kind, presence: { message: "Pregunta debe ser de un tipo" }
  validate :has_at_least_one_answer

# methods
  def has_at_least_one_answer
    if kind == "Seleccionar una opción"
      errors.add(:base, "Necesita tener al menos dos posibles respuestas") if answers.length < 2
    end
  end

end
