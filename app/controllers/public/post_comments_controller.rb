class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id

    if comment.save
       redirect_to post_path(post)
    else
      @post1 = Post.new
      @post = Post.find(params[:post_id])
      @post_comment = PostComment.new
      render 'public/posts/show'
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content)
  end


end
