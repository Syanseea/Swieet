class Public::RelationshipsController < ApplicationController
  
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end 
  
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end 
  
  def followers
    @post1 = Post.new
    @user = User.find(params[:user_id])
    @followers = @user.followers
    @followings = @user.followings
  end
  
  def followings
    @post1 = Post.new
    @user = User.find(params[:user_id])
    @followers = @user.followers
    @followings = @user.followings
  end 
  
end
