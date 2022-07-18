class Admin::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to admin_posts_path
    else render 'index'
    end
  end
end
