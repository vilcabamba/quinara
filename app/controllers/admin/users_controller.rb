module Admin
  class UsersController < AdminController
    
    def index
    end

    def new
      @user = User.new
    end
    
  end
end
