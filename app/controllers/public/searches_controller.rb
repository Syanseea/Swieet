class Public::SearchesController < ApplicationController

  def search

    @post1 = Post.new
    @users = User.looks(params[:word]).page(params[:page]).per(10)
    @posts = Post.looks(params[:word]).page(params[:page]).per(10)
  end
end
