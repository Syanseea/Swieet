class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post1 = Post.new
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post1 = Post.new
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).page(params[:page]).per(10)
      render 'index'
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
