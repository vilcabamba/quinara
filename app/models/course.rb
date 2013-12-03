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

end
