module Admin
  class CoursesController < AdminController

    before_action :find_course, only: [:edit, :update, :destroy]

    def index
      @courses = Course.all
    end

    def edit
    end

    def new
      @course = Course.new
    end

    def create
      @course = Course.new course_params
      if @course.save
        flash["alert-success"] = "Curso guardado"
        redirect_to action: :index
      else
        flash["alert-error"] = "Curso no guardado"
        render :new
      end
    end

    def update
      if @course.update_attributes course_params
        flash["alert-success"] = "Curso actualizado"
        redirect_to action: :index
      else
        flash["alert-error"] = "Curso no actualizado"
        render :edit
      end
    end

    def destroy
      @course.destroy
      flash["alert-info"] = "Curso eliminado"
      redirect_to action: :index
    end

    private

    def find_course
      @course = Course.find params[:id]
    end

    def course_params
      params.require(:course).permit :nivel,
                                   :numero
    end
  end
end
