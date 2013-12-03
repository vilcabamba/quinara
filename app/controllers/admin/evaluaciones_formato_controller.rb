module Admin
  class EvaluacionesFormatoController < AdminController
    
    before_action :find_course

    def index
    end

    def new
      @formato = EvaluacionFormato.new
    end

    def create
      raise "not so fast, sweetie"
    end

    private

    def find_course
      @course = Course.find params[:course_id]
    end
  end
end