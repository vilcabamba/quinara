# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  nombre     :string(255)      not null
#

class Course < ActiveRecord::Base
  include CourseDocente
  include CourseUsers

# scopes
  default_scope { order(:nombre) }

# validations:
  validates :nombre, presence: true, :uniqueness =>  { :case_sensitive => false }

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
    if evaluacion_formato.present?
      evaluaciones_count = evaluacion_formato.formatos_count
      if position > evaluaciones_count
        position = position - evaluaciones_count
      end
    end
    position
  end
  def is_tiny_kids?
    nombre =~ Regexp.new("tiny kids", true)
  end

end
