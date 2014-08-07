# encoding: utf-8
# == Schema Information
#
# Table name: evaluacions
#
#  id             :integer          not null, primary key
#  created_at     :datetime
#  updated_at     :datetime
#  nombre         :string(255)
#  course_id      :integer
#  available_from :datetime
#  available_to   :datetime
#

class Evaluacion < ActiveRecord::Base
  include EvaluacionUsers
  include EvaluacionQuestions
  include EvaluacionAdvises
  include EvaluacionFormatoValidations
  include EvaluacionReusable

# relationships
  belongs_to :course
  has_many :secciones, class_name: Seccion
  has_many :questions, through: :secciones
  has_many :user_answers, through: :questions

# validations
  validates :nombre, presence: { message: "Nombre de la pregunta no puede estar en blanco" }
  validate :nombre_unique_in_course
  validate :has_at_least_one_seccion_and_question
  # validate :is_worth_ten_points
  # validate :has_all_sections

# nested attributes
  accepts_nested_attributes_for :secciones, allow_destroy: true

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
  def has_at_least_one_seccion_and_question
    errors.add(:base, "Necesita tener al menos una sección") if secciones.length == 0
    # errors.add(:base, "Necesita tener al menos una pregunta") if questions.length == 0
  end
  def open?
    return false if not available_from.blank? and available_from > Time.now
    return false if not available_to.blank? and available_to < Time.now
    true
  end

end
