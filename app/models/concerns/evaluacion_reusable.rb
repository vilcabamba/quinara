module EvaluacionReusable
  def reuse
    # deep thoughts *-*
    self.dup.tap { |new_evaluacion|
      new_evaluacion.secciones = self.secciones.collect { |seccion|
        seccion.dup.tap { |new_seccion|
          new_seccion.questions = seccion.questions.collect { |question|
            question.dup.tap { |new_question|
              new_question.answers = question.answers.collect(&:dup)
            }
          }
        }
      }
    }
  end
end
