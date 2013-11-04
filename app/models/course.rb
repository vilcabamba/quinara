class Course < ActiveRecord::Base

# scopes
  default_scope { order(:nombre) }

# accessors:
  attr_accessor :docente_id

# validations:
  validates :nombre, presence: true, uniqueness: true

# callbacks:
  after_save :set_docente!

# relationships:
  has_many :evaluacions
  has_many :user_rols
  has_many :users, through: :user_rols

# methods:
  def set_docente!
    if docente and @new_docente_id != docente.id
      docente_rol.destroy
    end
    if @new_docente_id != 0
      UserRol.create course: self, rol: Rol.docente, user_id: @new_docente_id
    end
  end
  def docente
    @docente ||= docente_rol.user if docente_rol
  end
  def docente_rol
    @docente_rol ||= user_rols.where(rol_id: Rol.docente.id).first
  end
  def docente_id=(new_id)
    @new_docente_id = new_id.to_i
  end
  def docente_id
    docente.id if docente
  end

end
