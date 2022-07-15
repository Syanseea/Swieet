class Public::SearchesController < ApplicationController
  
  def search
    
    @post1 = Post.new
    @users = User.looks(params[:word])
    @posts = Post.looks(params[:word])
  end
end
