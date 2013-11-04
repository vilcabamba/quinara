class AlumnosController < DocenteController

  def index
    @alumnos = {
      ya: @course.students,
      no: @course.not_students
    }
  end

  def toggle
    @user = User.find params[:id]
    if @user.belongs_to_course?(@course)
      @course.remove_student @user
      @added = false
    else
      @course.add_student @user
      @added = true
    end
  end
end
