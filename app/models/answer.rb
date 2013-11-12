class Answer < ActiveRecord::Base

# relationships
  belongs_to :question
  has_many :usuario_respuestas

# validations
  validate :texto_presence_if_necessary

# methods
  def texto_presence_if_necessary
    # erorrs.add(:texto, "Posible respuesta debe tener texto") if question.kind == "Seleccionar una opción" and texto.blank?
  end

end
