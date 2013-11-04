class AlumnosController < DocenteController

  def show
    @alumnos = {
      ya: @course.students,
      no: @course.not_students
    }
  end

  def add
    
  end
  
end
