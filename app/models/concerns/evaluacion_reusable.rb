module EvaluacionReusable
  
  def reuse
    self.dup.tap do |new_evaluacion|
      new_evaluacion.secciones = self.secciones.collect do |seccion|
        seccion.dup.tap do |new_seccion|
          new_seccion.questions = seccion.questions.collect do |question|
            question.dup.tap do |new_question|
              new_question.answers = question.answers.collect(&:dup)
            end
          end
        end
      end
    end
  end
end
