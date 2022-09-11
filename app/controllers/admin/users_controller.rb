class Admin::UsersController < ApplicationController
  ##ページを１０個の情報で区切れるようにした
  def index
    @users = User.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    else render 'index'
    end
  end

end
