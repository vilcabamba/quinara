module Admin
  class UsersController < AdminController

    def index
      @users = User.all
    end

    def new
      @user = User.new
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

    private

    def user_params
      params.require(:user).permit :username,
                                   :email,
                                   :imagen,
                                   :nombres,
                                   :apellidos,
                                   :tipo_identificacion,
                                   :identificacion,
                                   :direccion,
                                   :telefono,
                                   :password,
                                   :password_confirmation
    end
    
  end
end
