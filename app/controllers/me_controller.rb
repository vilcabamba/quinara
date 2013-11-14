class MeController < ApplicationController

  before_filter :require_login

  def index
    @user = current_user
  end

  def show
    redirect_to action: :index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes user_params
      flash["alert-success"] = "Tu perfil fue actualizado."
      render :index
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :username,
                                 :email,
                                 :imagen,
                                 :remove_imagen,
                                 :imagen_cache,
                                 :nombres,
                                 :apellidos,
                                 :tipo_identificacion,
                                 :identificacion,
                                 :direccion,
                                 :fecha_nacimiento,
                                 :telefono,
                                 :password,
                                 :password_confirmation
  end
  
end
