# encoding: utf-8
class Evaluacion < ActiveRecord::Base
  include EvaluacionUsers

# relationships
  belongs_to :course
  has_many :questions
  has_many :user_answers, through: :questions

# validations
  validates :nombre, presence: { message: "Nombre de la pregunta no puede estar en blanco" }
  validate :nombre_unique_in_course
  validate :is_worth_ten_points
  validate :has_all_sections

# nested attributes
  accepts_nested_attributes_for :questions, allow_destroy: true

# methods
  def nombre_unique_in_course
    if new_record?
      @error_uniqueness_of_nombre = true if course.evaluaciones.exists?(nombre: nombre)
    else
      @error_uniqueness_of_nombre = true if course.evaluaciones.where.not(id: id).exists?(nombre: nombre)
    end
    if @error_uniqueness_of_nombre
      errors.add(:nombre, "Ya existe una evaluación con ese nombre")
    end
  end
  def is_worth_ten_points
    puntos = 0
    questions.each do |question|
      puntos += question.puntaje_maximo.to_f
    end
    errors.add(:base, "Debe valer 10 puntos") unless puntos == 10
  end
  def has_all_sections
    errors.add(:base, "Debe tener Writing") unless questions.any?(&:is_writing)
    errors.add(:base, "Debe tener Grammar") unless questions.any?(&:is_grammar)
    errors.add(:base, "Debe tener Listening") unless questions.any?(&:is_listening)
  end

end
