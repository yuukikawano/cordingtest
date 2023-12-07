class Admin::UsersController < ApplicationController
  def index 
    @users = User.all
  end 

  def show 
    @user = User.find(params[:id])
    selected_month = params[:selected_month]
    if selected_month.present? 
      start_date = Date.today.beginning_of_year.change(month: selected_month.to_i)
      end_date = start_date.end_of_month 
      @records = Recordattend.where(user_id: params[:id], attendtime: start_date..end_date)
    else   
      @records = Recordattend.where(user_id: params[:id])
    end 
  end 

  def update 
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else   
      render :show 
    end 
  end
  
  private 
    def user_params 
      params.require(:user).permit(:hourlewage, :occupation)
    end 
end