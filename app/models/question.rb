# encoding: utf-8
class Question < ActiveRecord::Base
# relationships
  belongs_to :evaluacion
  has_many :answers
  has_many :usuario_respuestas

# nested
  accepts_nested_attributes_for :answers, allow_destroy: true

# validations
  validates :puntaje_maximo, numericality: { greater_than: 0, message: "Puntaje máximo de la pregunta no es un número" },
                             presence: { message: "Pregunta debe tener un puntaje máximo" }
  validates :texto, presence: { message: "Pregunta debe tener una instrucción" }
  validates :section, presence: { message: "Pregunta debe pertenecer a una sección" }
  validates :kind, presence: { message: "Pregunta debe ser de un tipo" }
  validate :has_at_least_one_answer

# methods
  def has_at_least_one_answer
    if kind == "Seleccionar una opción"
      errors.add(:base, "Necesita tener al menos dos posibles respuestas") if answers.length < 2
    end
  end
  def is_writing
    section == "Writing"
  end
  def is_listening
    section == "Listening"
  end
  def is_grammar
    section == "Grammar"
  end
# class methods
  def self.kinds # tipos de pregunta
    ["Seleccionar una opción", "Verdadero o Falso", "Escriba la respuesta", "Escoja la respuesta"]
  end
  def self.sections
    %w(Listening Writing Grammar)
  end

end
