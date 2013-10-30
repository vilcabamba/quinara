module Admin
  class UsersController < AdminController
    
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end
    
  end
end
