module CourseUsers
  
  def students
    @students ||= User.where id: user_rols.select(:user_id).where(rol_id: Rol.alumno.id)
  end

end
