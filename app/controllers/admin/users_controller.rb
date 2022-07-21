class Admin::UsersController < ApplicationController
  
  def index
    @users = User.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      redirect_to admin_users_path
    else render 'index'
    end
  end

end
