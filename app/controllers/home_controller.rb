class HomeController < ApplicationController
  
  before_action :require_login

  def index
    @courses = {
      teacher: current_user.courses_as_teacher,
      student: current_user.courses_as_student
    }
  end

end
