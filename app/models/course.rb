class Course < ActiveRecord::Base
  include CourseDocente
  include CourseUsers

# scopes
  default_scope { order(:nombre) }

# validations:
  validates :nombre, presence: true, uniqueness: true

# relationships:
  has_one :evaluacion_formato
  has_many :evaluaciones, class_name: Evaluacion
  has_many :user_rols
  has_many :users, through: :user_rols

# methods:
  def number_of_evaluacion(evaluacion)
    index = evaluaciones.order(:id).index(evaluacion)
    position = case index
    when nil
      evaluaciones.count + 1
    else
      index + 1
    end
    if position > 3
      position = position - 3
    end
    position
  end

end
