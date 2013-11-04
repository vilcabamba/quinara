module UserCourses
  extend ActiveSupport::Concern

  def courses_as_teacher
    Course.where id: user_rols.select(:course_id).where(rol_id: Rol.docente.id)
  end
  def courses_as_student
    Course.where id: user_rols.select(:course_id).where(rol_id: Rol.alumno.id)
  end
  def is_teacher_in_course?(course)
    user_rols.exists? rol_id: Rol.docente.id, course_id: course.id
  end
end
