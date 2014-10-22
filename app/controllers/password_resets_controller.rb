class PasswordResetsController < ApplicationController
  skip_before_filter :require_login
  def new
    
  end
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_reset_password_instructions!
      redirect_to(root_path, :notice => 'Las instrucciones han sido enviadas a su correo')
    else
      redirect_to(root_path, :notice => 'No se ha podido encontrar el usuario')
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    if @user.blank?
      not_authenticated
      return
    end
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, :notice => 'Contraseña ha sido cambiada')
    else
      render :action => "edit"
    end
  end
end
