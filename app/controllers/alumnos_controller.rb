class AlumnosController < DocenteController

  before_action :find_alumnos, only: [:index, :toggle]

  def index
  end

  def toggle
    @user = User.find params[:id]
    if @user.belongs_to_course?(@course)
      @course.remove_student @user
    else
      @course.add_student @user
    end
  end

  private

  def find_alumnos
    @alumnos = {
      ya: @course.students,
      no: @course.not_students
    }
  end
end
