module CourseUsers
  
  def students
    @students ||= User.where id: user_rols.select(:user_id).where(rol_id: Rol.alumno.id)
  end
  def not_students
    @not_students ||= User.where.not id: user_rols.select(:user_id)
  end
  def add_student(user)
    user_rols.create rol: Rol.alumno, user: user
  end
  def remove_student(user)
    user_rols.where(rol: Rol.alumno, user: user).destroy
  end

end
