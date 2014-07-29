class AdminController < ApplicationController

  layout "admin"
  before_action :require_login
  before_action :confirm_logged_in_admin

  protected

  def confirm_logged_in_admin
    if not current_user.admin
      flash["alert-error"] = "No tienes permiso de acceder. Consulta con el administrador del sistema"
      redirect_to root_path
      false
    end
  end

end
