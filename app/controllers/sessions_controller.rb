# encoding: utf-8
class SessionsController < ApplicationController

  def index
  end

  def create
    if login(params[:username], params[:password])
      flash["alert-success"] = "Iniciaste sesión como #{current_user.nombres_o_username}"
      redirect_to root_path
    else
      flash["alert-error"] = "Usuario o contraseña inválidos"
      render :index
    end
  end

  def destroy
    logout
    redirect_to action: :index
  end

end
