module CourseDocente
  extend ActiveSupport::Concern

  included do
    after_save :set_docente!
  end

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
