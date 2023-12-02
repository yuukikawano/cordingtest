class UsersController < ApplicationController
    def index 
      @users = User.all
    end  
  
    def new 
      @user = User.new 
    end
  
    def create 
      @user = User.create(user_params)
      @user.save
      redirect_to recordattends_path
    end
  
    def test 
    end
  
    private
      def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
  end
  