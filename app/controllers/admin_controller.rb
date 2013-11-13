class AdminController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in_admin

  protected

  def confirm_logged_in_admin
    if not require_login or not current_user.admin
      redirect_to root_path
      false
    end
  end

end
