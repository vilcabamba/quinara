module Admin
  class EvaluacionesFormatoController < AdminController

    before_action :find_course

    def index
    end

    def new
    end

    def edit
      @formato = @course.evaluacion_formato
      render :new
    end

    def create
      if @course.evaluacion_formato
        @course.evaluacion_formato.destroy
      end
      formato = EvaluacionFormato.new course: @course
      formato.formatos_count = params[:formatos_count]
      formato.formato = {terms: params[:terms].permit!}
      formato.save!
      flash["alert-success"] = "Guardado."
      redirect_to action: :index
    end

    def destroy
      @course.evaluacion_formato.destroy
      flash["alert-success"] = "Eliminado."
      redirect_to action: :index
    end

    private

    def find_course
      @course = Course.find params[:course_id]
    end
  end
end
