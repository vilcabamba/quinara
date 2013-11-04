class Course < ActiveRecord::Base
  include CourseDocente
  include CourseUsers

# scopes
  default_scope { order(:nombre) }

# validations:
  validates :nombre, presence: true, uniqueness: true

# relationships:
  has_many :evaluacions
  has_many :user_rols
  has_many :users, through: :user_rols

end
