class AlumnosController < DocenteController

  def index
    @alumnos = {
      ya: @course.students,
      no: @course.not_students
    }
  end

  def toggle
    
  end
end
