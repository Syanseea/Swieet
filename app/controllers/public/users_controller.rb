class Public::UsersController < ApplicationController

  def show
    @post1 = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @post1 = Post.new
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  def menus
  end

  def mypage

    @post1 = Post.new
    @user = current_user
    @posts = @user.posts.all

  end

  def mypagefavo

    @post1 = Post.new
    @user = current_user

  end

  def mypagemenus

    @post1 = Post.new
    @user = current_user

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
