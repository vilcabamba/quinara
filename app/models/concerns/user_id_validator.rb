# encoding: utf-8
module UserIdValidator
  extend ActiveSupport::Concern

  included do
    validate :validate_id_if_necessary
  end

  def id_validator
    if not @id_validator or @id_validator.id != identificacion
      @id_validator = IdEcuador.new(identificacion)
    end
    @id_validator
  end

  def validate_id_if_necessary
    unless identificacion.blank?
      if tipo_identificacion == "Cédula"
        errors.add(:identificacion, "No es una cédula válida") unless id_validator.valid? and id_validator.tipo_id_sym == :cedula
      end
    end
  end
end
