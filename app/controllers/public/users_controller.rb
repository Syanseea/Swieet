class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @post1 = Post.new
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(created_at: :desc).page(params[:page]).per(10)
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
    @post1 = Post.new
    @user = User.find(params[:id])
    @menus = @user.menus.where(is_active: 'true').order(created_at: :desc).page(params[:page]).per(10)
  end

  def mypage

    @post1 = Post.new
    @user = current_user
    @posts = @user.posts.all.order(created_at: :desc).page(params[:page]).per(10)

  end

  def mypagefavo

    @post1 = Post.new
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @favorite_posts = Kaminari.paginate_array(@favorite_posts).page(params[:page]).per(10)

  end

  def mypagemenus

    @post1 = Post.new
    @user = current_user
    @menus = @user.menus.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
