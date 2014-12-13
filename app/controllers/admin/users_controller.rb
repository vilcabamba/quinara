module Admin
  class UsersController < AdminController

    before_action :find_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all
    end

    def new
      @user = User.new
      @show_all_fields = true
    end

    def edit
      @show_all_fields = true
    end

    def create
      @user = User.new user_params
      if @user.save
        flash["alert-success"] = "Usuario guardado"
        redirect_to action: :index
      else
        flash["alert-error"] = "Usuario no guardado"
        render :new
      end
    end

    def update
      if @user.update_attributes user_params
        flash["alert-success"] = "Usuario actualizado"
        redirect_to action: :index
      else
        flash["alert-error"] = "Usuario no actualizado"
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash["alert-info"] = "Usuario eliminado"
      redirect_to action: :index
    end

    private

    def find_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit :username,
                                   :email,
                                   :imagen,
                                   :remove_imagen,
                                   :imagen_cache,
                                   :nombres,
                                   :apellido_paterno,
                                   :apellido_materno,
                                   :tipo_identificacion,
                                   :fecha_nacimiento,
                                   :identificacion,
                                   :direccion,
                                   :telefono,
                                   :password,
                                   :password_confirmation,
                                   :admin
    end

  end
end
