class Course < ActiveRecord::Base

# scopes
  default_scope { order(:nombre) }

# validations:
  validates :nombre, presence: true, uniqueness: true

# relationships:
  has_many :user_rols
  has_many :users, through: :user_rols

end
