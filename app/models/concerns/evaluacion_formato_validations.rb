module EvaluacionFormatoValidations
  extend ActiveSupport::Concern

  included do
    validate :matches_formato
  end

  def matches_formato
    if course.evaluacion_formato

    end
  end

end
