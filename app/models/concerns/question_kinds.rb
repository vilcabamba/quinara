module QuestionKinds
  extend ActiveSupport::Concern

  def is_writing?
    section == "Writing"
  end
  def is_listening?
    section == "Listening"
  end
  def is_grammar?
    section == "Grammar"
  end
  def is_vocabulary?
    section == "Vocabulary"
  end
  def is_reading?
    section == "Reading"
  end

  module ClassMethods
    def kinds # tipos de pregunta
      ["Seleccionar una opción", "Verdadero o Falso", "Escriba la respuesta", "Escoja la respuesta", "Pregunta oral"]
    end
  end  
end
