class Question < ActiveRecord::Base
# relationships
  belongs_to :evaluacion
  has_many :answers
  has_many :usuario_respuestas

# nested
  accepts_nested_attributes_for :answers, allow_destroy: true

# validations
  validates :puntaje_maximo, numericality: { greater_than: 0 },
                             presence: true
  validates :texto, presence: true
  validate :has_at_least_one_answer

# methods
  def has_at_least_one_answer
    errors.add(:base, "Necesita tener al menos dos posibles respuestas") if answers.length < 2
  end

end
