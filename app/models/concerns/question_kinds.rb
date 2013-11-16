module QuestionKinds
  extend ActiveSupport::Concern

  def is_writing
    section == "Writing"
  end
  def is_listening
    section == "Listening"
  end
  def is_grammar
    section == "Grammar"
  end

  module ClassMethods
    def kinds # tipos de pregunta
      ["Seleccionar una opción", "Verdadero o Falso", "Escriba la respuesta", "Escoja la respuesta"]
    end
    def sections
      %w(Listening Writing Grammar)
    end
  end  
end
