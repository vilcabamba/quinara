module Admin
  class EvaluacionesFormatoController < AdminController
    
    before_action :find_course

    def index
    end

    def new
      @formato = EvaluacionFormato.new
    end

    def create
      formato = EvaluacionFormato.new course: @course
      formato.formato = {terms: params[:terms].permit!}
      formato.save!
      flash["alert-success"] = "Guardado."
      redirect_to action: :index
    end

    private

    def find_course
      @course = Course.find params[:course_id]
    end
  end
end