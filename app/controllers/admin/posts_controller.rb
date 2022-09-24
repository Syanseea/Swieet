class Admin::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(10)
  end
#destroy
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_posts_path
    else render 'index'
    end
  end
end
