class Evaluacion < ActiveRecord::Base
# relationships
  belongs_to :course
  has_many :questions

# validations
  validates :nombre, presence: true
  validate :nombre_unique_in_course

# nested attributes
  accepts_nested_attributes_for :questions, allow_destroy: true

# methods
  def nombre_unique_in_course
    errors.add(:nombre, "Ya existe una evaluación con ese nombre") if course.evaluaciones.exists?(nombre: nombre)
  end

end
