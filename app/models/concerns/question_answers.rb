module QuestionAnswers
  extend ActiveSupport::Concern
  
  module ClassMethods
    def process_answer(question_id, answer)
      question = find question_id
      case question.kind
      when "Seleccionar una opción"
        { question_id: question_id, answer_id: answer }
      when "Verdadero o Falso"
        { question_id: question_id, content: eval(answer) }
      when "Escriba la respuesta"
        { question_id: question_id, content: answer }
      when "Pregunta oral"
        { question_id: question_id }
      when "Escoja la respuesta"
        { question_id: question_id, content: answer }
      end
    end
  end
end
